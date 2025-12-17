#!/bin/sh
# Versión: V23 - FIX de REGION COMPLETA y FIX de limpieza de NOMBRE INTERNO

# --- CONFIGURACIÓN DE ARCHIVOS ---
directorio_roms="${PWD}" 
archivo_csv="roms_n64_metadata.csv"
archivo_ini="mupen64plus.ini"
archivo_cache_rmg="RomHeaderAndSettingsCache.cache"
archivo_lookup_rmg="rmg_id_lookup.csv" # Archivo intermedio (GoodName, ID RMG)
archivo_csv_temporal="roms_n64_metadata.tmp.csv" 
MARCADOR_RMG="RMG_ID_MISSING" # Marcador temporal para ID RMG

# Definición de la cabecera (19 campos)
CABECERA_SOLICITADA="\"Nombre del Archivo\",\"Nombre Interno\",\"ID Real\",\"ID RMG\",\"Region\",\"Idiomas\",\"Jugadores\",\"Memoria\",\"Retumbe\",\"Transferidor\",\"Clasificacion\",\"Inicia\",\"Mensaje NOTA(S)\",\"Tamano\",\"Orden de bytes (Formato Real)\",\"Extension\",\"MD5\",\"CRC1\",\"CRC2\""

# --------------------------------------------------------------------------------
# --- FUNCIÓN AUXILIAR: TRADUCIR CÓDIGO DE REGIÓN (MEJORA CRÍTICA) ---
traducir_codigo_region() {
    local codigo="$1"
    # TRADUCCIÓN EXTENDIDA
    case "$codigo" in
        A) echo "AUS" ;; # Australia
        D) echo "GER" ;; # Alemania
        E|U) echo "USA" ;; # América (USA)
        F) echo "FRA" ;; # Francia
        I) echo "ITA" ;; # Italia
        J) echo "JAP" ;; # Japón
        K) echo "KOR" ;; # Corea
        N) echo "NLD" ;; # Holanda
        P) echo "EUR" ;; # Europa
        S) echo "SWE" ;; # Suecia
        *) echo "$codigo" ;; # Devuelve el código original si no es reconocido
    esac
}

# --------------------------------------------------------------------------------
# --- FUNCIÓN 1: EXTRACCIÓN DE IDIOMAS DEL NOMBRE (POSIX) ---
traducir_codigo_idioma() {
    local codigo="$1"
    case "$codigo" in
        E) echo "Espanol" ;;
        F) echo "Frances" ;;
        G) echo "Aleman" ;;
        I) echo "Italiano" ;;
        J) echo "Japones" ;;
        U) echo "Ingles" ;;
        P) echo "Ingles (PAL)" ;;
        A) echo "Australiano" ;;
        K) echo "Coreano" ;;
        N) echo "Holandes" ;;
        S) echo "Sueco" ;;
        T) echo "Taiwan" ;;
        *) echo "" ;;
    esac
}

extraer_idiomas_del_nombre() {
    local nombre_archivo="$1"
    local lista_temporal=""
    local codigos_simples
    
    # Extrae todos los códigos entre paréntesis (M3), (E), (J), etc.
    codigos_simples=$(echo "$nombre_archivo" | grep -o '([A-Z0-9]\+)' | tr -d '()')
    
    for codigo in $codigos_simples; do
        if [ "${codigo:0:1}" = "M" ]; then
            case "$codigo" in
                M2) lista_temporal="${lista_temporal}Ingles,Frances," ;;
                M3) lista_temporal="${lista_temporal}Ingles,Frances,Aleman," ;;
                M4) lista_temporal="${lista_temporal}Ingles,Frances,Aleman,Espanol," ;;
                M5) lista_temporal="${lista_temporal}Ingles,Frances,Aleman,Espanol,Italiano," ;;
                M6) lista_temporal="${lista_temporal}Ingles,Frances,Aleman,Espanol,Italiano,Holandes," ;;
                *) 
                    local i
                    i=1
                    while [ $i -lt ${#codigo} ]; do
                        local c
                        c=$(expr substr "$codigo" $((i+1)) 1)
                        local idioma
                        idioma=$(traducir_codigo_idioma "$c")
                        if [ -n "$idioma" ]; then
                            lista_temporal="${lista_temporal}${idioma},"
                        fi
                        i=$(expr $i + 1)
                    done
                    ;;
            esac
        else
            local i
            i=0
            while [ $i -lt ${#codigo} ]; do
                local c
                c=$(expr substr "$codigo" $((i+1)) 1)
                local idioma
                idioma=$(traducir_codigo_idioma "$c")
                if [ -n "$idioma" ]; then
                    lista_temporal="${lista_temporal}${idioma},"
                fi
                i=$(expr $i + 1)
            done
        fi
    done
    
    if [ -n "$lista_temporal" ]; then
        local lista_unica
        # Eliminar duplicados y el último separador
        lista_unica=$(echo "$lista_temporal" | tr ',' '\n' | grep -v '^\s*$' | sort -u | tr '\n' ',')
        echo "${lista_unica%,}" 
    else
        echo ""
    fi
}

# --------------------------------------------------------------------------------
# --- FUNCIÓN 2: EXTRACCIÓN DE METADATA (Directamente del Header) ---
extraer_metadata_header() {
    local rom_path="$1"
    local MD5 TAMANO_BYTES TAMANO_MB EXTENSION ORDEN_BYTES
    local HEADER_HEX MAGIC_NUMBER CRC1_RAW CRC2_RAW NOMBRE_INTERNO_RAW NOMBRE_INTERNO ID_REAL REGION_CODIGO REGION_FINAL

    if ! command -v hexdump > /dev/null 2>&1 || ! command -v md5sum > /dev/null 2>&1; then
        echo "[ERROR] Las herramientas 'hexdump' y/o 'md5sum' no se encontraron. Son requeridas." >&2
        return 1
    fi

    MD5=$(md5sum "$rom_path" | cut -d' ' -f1 | tr '[:lower:]' '[:upper:]')
    TAMANO_BYTES=$(wc -c < "$rom_path" | tr -d ' ')
    TAMANO_MB=$(awk "BEGIN {printf \"%.0f MB\", $TAMANO_BYTES/1024/1024}" 2>/dev/null)
    EXTENSION=$(basename "$rom_path" | rev | cut -d. -f1 | rev | tr '[:upper:]' '[:lower:]')
    ORDEN_BYTES="Desconocido"
    
    HEADER_HEX=$(hexdump -n 64 -e '16/1 "%02X"' "$rom_path" | tr -d '\n\r' | tr -d ' ')
    
    if [ -z "$HEADER_HEX" ] || [ "$(expr length "$HEADER_HEX")" -lt 128 ]; then
        echo "[ERROR] Fallo al leer la cabecera de la ROM (hexdump)." >&2
        return 1
    fi
    
    MAGIC_NUMBER=$(expr substr "$HEADER_HEX" 1 8)
    
    case "$MAGIC_NUMBER" in
        80371240) ORDEN_BYTES="Big Endian ($EXTENSION)" ;;
        37804012) ORDEN_BYTES="Little Endian ($EXTENSION)" ;;
        40123780) ORDEN_BYTES="Mixed Endian ($EXTENSION)" ;;
    esac

    CRC1_RAW=$(expr substr "$HEADER_HEX" 33 8)
    CRC2_RAW=$(expr substr "$HEADER_HEX" 41 8)
    
    # Extraer el Nombre Interno (hasta 20 bytes). Usamos 'cat' con el hexdump para evitar la limpieza excesiva de xargs/tr, 
    # y solo limpiamos caracteres no imprimibles (excepto espacios)
    NOMBRE_INTERNO_RAW=$(hexdump -s 32 -n 20 -e '1/1 "%c"' "$rom_path" | cat)
    
    # Limpiamos el Nombre Interno: 
    # 1. Eliminamos caracteres no imprimibles (incluyendo newlines)
    # 2. Reemplazamos NUL (ASCII 0) con espacio
    # 3. Recortamos espacios en blanco al inicio y al final (usando 'xargs')
    NOMBRE_INTERNO=$(echo "$NOMBRE_INTERNO_RAW" | tr -c '[:print:]\t' ' ' | tr '\0' ' ' | xargs 2>/dev/null) 
    
    ID_REAL=$(hexdump -s 59 -n 4 -e '1/1 "%c"' "$rom_path" | tr -d '\n' | xargs 2>/dev/null)
    
    # Extraemos el código de una letra y lo traducimos
    REGION_CODIGO=$(expr substr "$ID_REAL" 4 1)
    REGION_FINAL=$(traducir_codigo_region "$REGION_CODIGO")
    
    echo "$NOMBRE_INTERNO,$ID_REAL,$REGION_FINAL,$TAMANO_MB,$ORDEN_BYTES,$EXTENSION,$MD5,$CRC1_RAW,$CRC2_RAW"
    return 0
}

# --------------------------------------------------------------------------------
# --- FUNCIÓN 3: OBTENER CONFIGURACIÓN DEL INI (POSIX) ---
obtener_config_ini() {
    local md5_key="[$1]"
    local ini_file="$2"
    local config_data
    local good_name="|" players="1|" save_type="|" rumble="|" count_per_op="|" status="|"
    
    # Extraemos todos los campos relevantes de la sección MD5
    config_data=$(awk -F= -v md5_key="$md5_key" '
    BEGIN {
        good_name="|" ; players="1|" ; save_type="|" ; rumble="|" ; count_per_op="|" ; status="|"
    }
    $0 == md5_key { 
        section_found=1; 
        next
    }
    section_found == 1 {
        if ($1 ~ /^\[.*\]$/) { exit } 
        
        if (split($0, arr, /[[:space:]]*=[[:space:]]*/) >= 2) {
            
            if (arr[1] ~ /^GoodName/) { 
                good_name=substr($0, index($0, "=") + 1) "|" 
            } else if (arr[1] ~ /^Players/) { 
                players=arr[2] "|"
            } else if (arr[1] ~ /^SaveType/) { 
                save_type=arr[2] "|"
            } else if (arr[1] ~ /^Rumble/) { 
                rumble=arr[2] "|"
            } else if (arr[1] ~ /^CountPerOp/) { 
                count_per_op=arr[2] "|"
            } else if (arr[1] ~ /^Status/) { 
                status=arr[2] "|"
            }
        }
    }
    END {
        # Limpiamos espacios en GoodName y el resto de valores
        gsub(/^[[:space:]]+|[[:space:]]+$/, "", good_name)
        gsub(/^[[:space:]]+|[[:space:]]+$/, "", players)
        gsub(/^[[:space:]]+|[[:space:]]+$/, "", save_type)
        gsub(/^[[:space:]]+|[[:space:]]+$/, "", rumble)
        gsub(/^[[:space:]]+|[[:space:]]+$/, "", count_per_op)
        gsub(/^[[:space:]]+|[[:space:]]+$/, "", status)
        
        print good_name players save_type rumble count_per_op status
    }' "$ini_file" | tr -d '\n\r')

    GOOD_NAME=$(echo "$config_data" | cut -d'|' -f1)
    players=$(echo "$config_data" | cut -d'|' -f2)
    save_type=$(echo "$config_data" | cut -d'|' -f3)
    rumble=$(echo "$config_data" | cut -d'|' -f4)
    count_per_op=$(echo "$config_data" | cut -d'|' -f5)
    status=$(echo "$config_data" | cut -d'|' -f6)

    # Conversión a campos del CSV
    JUGADORES="${players:-1}" 
    MEMORIA="No"
    case "$save_type" in
        eeprom|sram|flash|"Controller Pak"|Mempak) MEMORIA="Si" ;;
    esac
    
    RETUMBE="No"
    if [ "$rumble" = "Yes" ]; then
        RETUMBE="Si"
    fi
    
    TRANSFERIDOR="No"
    if [ "$count_per_op" = "1" ] && [ "$save_type" = "Controller Pak" ]; then
        TRANSFERIDOR="Si"
    fi
    
    CLASIFICACION="Desconocido"
    case "$status" in
        1) CLASIFICACION="Funciona Genial" ;;
        2) CLASIFICACION="Con Problemas Menores" ;;
        3) CLASIFICACION="Con Problemas Serios" ;;
        0) CLASIFICACION="No Funciona" ;;
    esac

    # Retornamos el GOOD_NAME (para la clave de búsqueda) y los 5 campos de configuración
    echo "$GOOD_NAME|$JUGADORES|$MEMORIA|$RETUMBE|$TRANSFERIDOR|$CLASIFICACION"
}

# --------------------------------------------------------------------------------
# --- FUNCIÓN 4: GENERAR ARCHIVO DE LOOKUP RMG (Lectura Binaria) ---
generar_lookup_rmg() {
    local cache_file="$1"
    local lookup_file="$archivo_lookup_rmg"
    local total_lines

    if [ ! -f "$cache_file" ]; then
        echo "⚠️ Archivo de caché binario ($cache_file) no encontrado. Omitiendo generación de lookup." >&2
        return 1
    fi
    
    echo "⚙️ Generando archivo de lookup RMG ($lookup_file) del caché binario..."
    
    # 1. Escribir Cabecera al archivo final
    echo "\"GoodName\",\"ID RMG\"" > "$lookup_file"
    
    # 2. Extraer y apendizar el contenido usando AWK (el patrón de lookback)
    strings -n 2 "$cache_file" | awk '
        BEGIN { 
            FS="\n"; 
            l[1] = ""; l[2] = ""; l[3] = ""
        }
        {
            l[3] = l[2]; l[2] = l[1]; l[1] = $0
            
            ID_RMG = l[3]
            GoodName = l[1]
            
            # Condición: 1. ID RMG: 4 caracteres, mayúsculas/números. 
            if (length(ID_RMG) == 4 && ID_RMG ~ /^[A-Z0-9]+$/) {
                
                gsub(/[[:space:]]+$/, "", GoodName)
                
                # Condición: 2. GoodName largo y línea de Región coherente.
                if (length(l[2]) > 5 && length(l[2]) < 30 && length(GoodName) > 10) { 
                    
                    # Imprimir el par: "GoodName",ID_RMG
                    print "\"" GoodName "\"," ID_RMG
                }
            }
        }
    ' 2>&1 | grep -E '^"' | sort -u >> "$lookup_file" 
    
    total_lines=$(wc -l < "$lookup_file" | tr -d ' ')
    echo "✅ Archivo de lookup RMG generado. Total de entradas: $((total_lines-1))"
    return 0
}

# --------------------------------------------------------------------------------

# --- PROCESO PRINCIPAL (POSIX) ---

# 0. Verificación e inicialización del CSV
if [ ! -f "$archivo_csv" ]; then
    echo "$CABECERA_SOLICITADA" > "$archivo_csv"
    echo "📜 Archivo de metadatos CSV ('$archivo_csv') inicializado."
fi

# 1. Generación del archivo de lookup RMG 
echo "---"
if [ -f "$archivo_cache_rmg" ]; then
    generar_lookup_rmg "$archivo_cache_rmg"
else
    echo "⚠️ Archivo de caché binario ($archivo_cache_rmg) no encontrado. Omitiendo la generación del lookup RMG."
fi
echo "---"

# 2. Procesamiento de ROMs (Fase 1: Extracción de metadatos y uso de marcador)

echo "🛠️ Procesando ROMs en '$directorio_roms' (Fase 1: Extracción y Marcador)..."

NUM_TOTAL_ROMS=$(find "$directorio_roms" -maxdepth 1 -type f -iregex '.*\.z64\|.*\.n64\|.*\.v64' -print0 2>/dev/null | tr -dc '\0' | wc -c | tr -d ' ')
contador=0

find "$directorio_roms" -maxdepth 1 -type f -iregex '.*\.z64\|.*\.n64\|.*\.v64' -print0 2>/dev/null | while IFS= read -r -d '' archivo; do
    contador=$(expr $contador + 1)
    nombre_archivo=$(basename "$archivo")
    
    printf "[%03d/%d] -> %s\n" "$contador" "$NUM_TOTAL_ROMS" "$nombre_archivo"
    
    # A. Extracción de Metadatos del Header (9 campos separados por comas)
    metadata=$(extraer_metadata_header "$archivo")
    if [ $? -ne 0 ]; then continue; fi
    
    # Descomposición de Header
    NOMBRE_INTERNO=$(echo "$metadata" | cut -d',' -f1)
    ID_REAL=$(echo "$metadata" | cut -d',' -f2)
    REGION_FINAL=$(echo "$metadata" | cut -d',' -f3) 
    TAMANO=$(echo "$metadata" | cut -d',' -f4)
    ORDEN_BYTES=$(echo "$metadata" | cut -d',' -f5)
    EXTENSION=$(echo "$metadata" | cut -d',' -f6)
    MD5=$(echo "$metadata" | cut -d',' -f7)
    CRC1=$(echo "$metadata" | cut -d',' -f8)
    CRC2=$(echo "$metadata" | cut -d',' -f9)
    
    # B. Extracción de configuración de hardware (6 campos separados por '|')
    CONFIG_DATA_PIPE=$(obtener_config_ini "$MD5" "$archivo_ini")
    
    # Descomposición de INI
    GOOD_NAME=$(echo "$CONFIG_DATA_PIPE" | cut -d'|' -f1) 
    JUGADORES=$(echo "$CONFIG_DATA_PIPE" | cut -d'|' -f2)
    MEMORIA=$(echo "$CONFIG_DATA_PIPE" | cut -d'|' -f3)
    RETUMBE=$(echo "$CONFIG_DATA_PIPE" | cut -d'|' -f4)
    TRANSFERIDOR=$(echo "$CONFIG_DATA_PIPE" | cut -d'|' -f5)
    CLASIFICACION=$(echo "$CONFIG_DATA_PIPE" | cut -d'|' -f6)

    # C. Extracción de Idiomas
    IDIOMAS_AUTO=$(extraer_idiomas_del_nombre "$nombre_archivo")
    
    # D. Escribimos al CSV con el marcador RMG (RMG_ID_MISSING)
    # Eliminamos línea antigua si existe
    if grep -q "^\"$nombre_archivo\"" "$archivo_csv" 2>/dev/null; then 
        echo "   -> [REEMPLAZANDO] Línea existente en CSV."
        grep -v "^\"$nombre_archivo\"" "$archivo_csv" > "$archivo_csv_temporal"
        mv "$archivo_csv_temporal" "$archivo_csv"
    fi
    
    # Usamos el GoodName del INI + la extensión del Header para la clave del CSV
    CLAVE_ARCHIVO_FINAL="${GOOD_NAME:-$nombre_archivo}.${EXTENSION}"
    
    # Escribimos los 19 campos.
    printf "\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\"\n" \
        "$CLAVE_ARCHIVO_FINAL" "$NOMBRE_INTERNO" "$ID_REAL" "$MARCADOR_RMG" "$REGION_FINAL" \
        "$IDIOMAS_AUTO" "$JUGADORES" "$MEMORIA" "$RETUMBE" "$TRANSFERIDOR" \
        "$CLASIFICACION" "" "" "$TAMANO" "$ORDEN_BYTES" "$EXTENSION" \
        "$MD5" "$CRC1" "$CRC2" >> "$archivo_csv"

done

# 3. Fase 2: Inyección optimizada de ID RMG (si el lookup fue generado)
if [ -f "$archivo_lookup_rmg" ]; then
    echo "---"
    echo "⚡️ Procesando ROMs (Fase 2: Inyección de ID RMG con AWK)..."
    
    # Lógica de AWK para la inyección de RMG
    awk -F',' -v OFS=',' -v lookup_file="$archivo_lookup_rmg" -v marcador="$MARCADOR_RMG" '
    
    BEGIN {
        # Cargamos el archivo de lookup en un array asociativo.
        while ((getline line < lookup_file) > 0) {
            gsub(/"/, "", line) # Eliminamos todas las comillas de la línea
            split(line, arr, /,/)
            GoodName = arr[1]
            ID_RMG = arr[2]
            IDs[GoodName] = ID_RMG
        }
        close(lookup_file)
    }
    
    NR==1 {
        print
        next
    }
    
    {
        clave_csv = $1
        # Eliminamos comillas y la extensión del archivo para que la clave coincida con el lookup
        gsub(/"/, "", clave_csv)
        sub(/\.[a-z0-9]+$/, "", clave_csv)
        
        # El campo 4 es el ID RMG (si no está, es el campo del MARCADOR)
        if ($4 == "\"" marcador "\"") { # El marcador siempre está entre comillas en el CSV
            if (clave_csv in IDs) {
                # ID encontrado, reemplazamos el marcador, envolviendo el ID en comillas
                $4 = "\"" IDs[clave_csv] "\""
            } else {
                # ID no encontrado, lo dejamos como una cadena vacía (un campo CSV con "")
                $4 = "\"\""
            }
        }
        
        # Imprimimos la línea modificada
        print
    }' "$archivo_csv" > "$archivo_csv_temporal"
    
    # Reemplazamos el archivo original por el temporal
    mv "$archivo_csv_temporal" "$archivo_csv"
    
    echo "✅ IDs RMG inyectados correctamente (usando AWK en una sola pasada)."
    
else
    echo "⚠️ Archivo de caché RMG ($archivo_cache_rmg) no encontrado. Omitiendo inyección de ID RMG."
fi

echo "---"
echo "🎉 Proceso completado. El archivo de metadatos final es '$archivo_csv'."

exit 0
