#!/bin/bash

# --- CONFIGURACIÓN DE ARCHIVOS ---
# 🚨 RUTA DE ROMS: Manteniendo la ruta configurada por el usuario
directorio_roms="/media/460GB/ROMs/N64" 

# Los siguientes archivos se crearán en el directorio donde se ejecuta el script:
archivo_csv="roms_n64_metadata.csv"
archivo_ini="mupen64plus.ini"
archivo_cache_rmg="RomHeaderAndSettingsCache.cache"
archivo_lookup_rmg="rmg_id_lookup.csv" 

# Definición de la cabecera (19 campos) - Estructura solicitada
CABECERA_SOLICITADA="\"Nombre del Archivo\",\"Nombre Interno\",\"ID Real\",\"ID RMG\",\"Region\",\"Idiomas\",\"Jugadores\",\"Memoria\",\"Retumbe\",\"Transferidor\",\"Clasificacion\",\"Inicia\",\"Mensaje NOTA(S)\",\"Tamano\",\"Orden de bytes (Formato Real)\",\"Extension\",\"MD5\",\"CRC1\",\"CRC2\""

# --- MAPEO DE CÓDIGOS DE ESTADO (Clasificación) ---
# Códigos de Status del INI: 1=Genial, 2=Menor, 3=Serio, 0=No Funciona
declare -A MAPA_STATUS=(
    [1]="Funciona Genial"
    [2]="Con Problemas Menores"
    [3]="Con Problemas Serios"
    [0]="No Funciona"
)

# --------------------------------------------------------------------------------
# --- FUNCIÓN 1: EXTRACCIÓN DE IDIOMAS DEL NOMBRE (Sin Acentos) ---
extraer_idiomas_del_nombre() {
    local nombre_archivo="$1"
    local lista_temporal=""
    local idiomas_finales=""
    local espanol_presente=0
    local ingles_presente=0
    
    declare -A MAPA_IDIOMAS=(
        [E]="Espanol" [F]="Frances" [G]="Aleman" [I]="Italiano" [J]="Japones"
        [U]="Ingles" [P]="Ingles (PAL)" [M2]="Ingles, Frances"
        [M3]="Ingles, Frances, Aleman" [M4]="Espanol, Ingles, Frances, Aleman" [M5]="Ingles, Aleman, Italiano, Frances, Espanol"
    )

    # 1. Extracción de códigos entre paréntesis
    while [[ "$nombre_archivo" =~ \(([A-Za-z0-9]+)\) ]]; do
        lista_temporal+="${BASH_REMATCH[1]},"
        nombre_archivo="${nombre_archivo/(${BASH_REMATCH[1]})/}"
    done
    
    # 2. Procesamiento de códigos y mapeo a nombres de idiomas
    IFS=',' read -ra CODIGOS <<< "$lista_temporal"
    for codigo in "${CODIGOS[@]}"; do
        if [ -n "$codigo" ]; then
            # Mapeo a códigos multinacionales M2/M3/M4/M5
            if [[ "$codigo" =~ ^M[2-5]$ ]]; then
                idiomas_finales+="${MAPA_IDIOMAS[$codigo]},"
            
            # Mapeo de códigos simples (E/U/J/G/F/I/P)
            elif [ ${MAPA_IDIOMAS[$codigo]+_} ]; then
                # Detección de Español/Inglés para priorización
                if [ "$codigo" = "E" ] && [ "$espanol_presente" -eq 0 ]; then
                    idiomas_finales+="${MAPA_IDIOMAS[$codigo]},"
                    espanol_presente=1
                elif [ "$codigo" = "U" ] && [ "$ingles_presente" -eq 0 ]; then
                    idiomas_finales+="${MAPA_IDIOMAS[$codigo]},"
                    ingles_presente=1
                elif [ "$codigo" != "E" ] && [ "$codigo" != "U" ]; then
                    idiomas_finales+="${MAPA_IDIOMAS[$codigo]},"
                fi
            fi
        fi
    done
    
    # 3. Eliminar la última coma y limpiar espacios. Si queda vacío, asignar "Desconocido".
    idiomas_finales=$(echo "$idiomas_finales" | sed 's/,$//')
    
    if [ -z "$idiomas_finales" ]; then
        echo "Ingles" # Por defecto, la mayoría de ROMs NTSC son en Inglés.
    else
        echo "$idiomas_finales"
    fi
}

# --------------------------------------------------------------------------------
# --- FUNCIÓN 2: EXTRAER METADATA DEL HEADER DE ROM ---
extraer_metadata_rom() {
    local archivo_rom="$1"
    local extension="${archivo_rom##*.}"
    local nombre_base=$(basename "$archivo_rom")
    
    # Verificación del formato (z64/n64)
    if [ "$extension" != "n64" ] && [ "$extension" != "z64" ]; then
        return 1
    fi
    
    # Usamos `xxd` (Hex dump) para extraer los primeros 40 bytes del header
    local header_hex=$(xxd -p -l 40 "$archivo_rom" | tr -d '\n')

    # A. Nombre Interno (20 bytes - 40 chars hex) - Offset 0x20
    # Nombre interno se encuentra en el offset 0x20 (byte 32)
    local NOMBRE_INTERNO_HEX=$(echo "$header_hex" | cut -c 65-104)
    local NOMBRE_INTERNO=$(echo "$NOMBRE_INTERNO_HEX" | xxd -r -p | tr -d '\0')

    # B. ID Real (4 bytes - 8 chars hex) - Offset 0x3C
    # ID Real se encuentra en el offset 0x3C (byte 60)
    local ID_REAL_HEX=$(echo "$header_hex" | cut -c 113-120)
    local ID_REAL=$(echo "$ID_REAL_HEX" | xxd -r -p | tr -d '\0')

    # C. Región (1 byte - 2 chars hex) - Offset 0x3E
    local REGION_HEX=$(echo "$header_hex" | cut -c 125-126)
    local REGION_CHAR=""
    case "$REGION_HEX" in
        45) REGION_CHAR="USA" ;; # E (NTSC)
        50) REGION_CHAR="EUR" ;; # P (PAL)
        4A) REGION_CHAR="JAP" ;; # J (NTSC)
        44) REGION_CHAR="GER" ;; # D (ALE)
        *)  REGION_CHAR="Desconocida" ;;
    esac
    
    # D. Tamaño del archivo (en MB)
    local TAMANO_BYTES=$(stat -c%s "$archivo_rom")
    local TAMANO=$((TAMANO_BYTES / 1024 / 1024))" MB"

    # E. Orden de bytes (Formato Real)
    local ORDEN_BYTES=""
    if [ "$extension" = "z64" ]; then
        ORDEN_BYTES="Big Endian (z64)"
    elif [ "$extension" = "n64" ]; then
        ORDEN_BYTES="Little Endian (n64)"
    else
        ORDEN_BYTES="Desconocido"
    fi

    # F. MD5, CRC1, CRC2
    local MD5=$(md5sum "$archivo_rom" | cut -d ' ' -f 1 | tr 'a-z' 'A-Z')
    # CRC1 (4 bytes) - Offset 0x10
    local CRC1=$(echo "$header_hex" | cut -c 33-40) 
    # CRC2 (4 bytes) - Offset 0x14
    local CRC2=$(echo "$header_hex" | cut -c 41-48) 

    # Imprimimos los campos separados por comas para facilitar la captura
    echo "$NOMBRE_INTERNO,$ID_REAL,$REGION_HEX,$REGION_CHAR,$TAMANO,$ORDEN_BYTES,$extension,$MD5,$CRC1,$CRC2"
    return 0
}

# --------------------------------------------------------------------------------
# --- FUNCIÓN 3: OBTENER CONFIGURACIÓN DEL INI ---
obtener_config_ini() {
    local md5_rom="$1"
    local archivo_ini="$2"
    
    # Valores por defecto
    local GOOD_NAME="Desconocido"
    local JUGADORES="1"
    local MEMORIA="No"
    local RETUMBE="No"
    local TRANSFERIDOR="No"
    local CLASIFICACION="Desconocido" # 0=No Funciona, 1=Genial, 2=Menor, 3=Serio
    
    if [ -f "$archivo_ini" ]; then
        # Usamos AWK para buscar la sección por MD5
        local md5_encontrado=$(awk -v md5_target="$md5_rom" '
            /\[[0-9A-Fa-f]{32}\]/ { 
                gsub(/[\[\]]/, "");
                if ($0 == md5_target) { 
                    print 1
                    exit 
                } 
            }
        ' "$archivo_ini")

        # Si el MD5 fue encontrado, extraemos los datos
        if [ "$md5_encontrado" = "1" ]; then
            local datos_ini=$(awk -v md5_target="$md5_rom" '
                # Captura de línea de inicio de sección
                /\[[0-9A-Fa-f]{32}\]/ { in_section = ($0 ~ "[" md5_target "]"); next }
                # Captura de línea de fin de sección o fin de archivo
                /\[[0-9A-Fa-f]{32}\]/ || NF==0 { in_section = 0 }
                # Procesamiento de campos dentro de la sección
                in_section && /^GoodName/ { good_name = $NF }
                in_section && /^Players/ { players = $NF }
                in_section && /^SaveType/ { 
                    if ($NF != "0") { memory = "Si" } else { memory = "No" }
                }
                in_section && /^Rumble/ { 
                    if ($NF == "1") { rumble = "Si" } else { rumble = "No" }
                }
                in_section && /^TransferPak/ {
                    if ($NF == "1") { transferidor = "Si" } else { transferidor = "No" }
                }
                in_section && /^Status/ { status_code = $NF }

                # Cuando llegamos al final, imprimir
                END {
                    # Si good_name se encontró, usarlo, sino, usar Desconocido
                    if (good_name == "") { good_name = "Desconocido" }
                    
                    # Convertir el Status Code a Clasificación
                    if (status_code == 1) { status_text = "Funciona Genial" }
                    else if (status_code == 2) { status_text = "Con Problemas Menores" }
                    else if (status_code == 3) { status_text = "Con Problemas Serios" }
                    else if (status_code == 0) { status_text = "No Funciona" }
                    else { status_text = "Desconocido" }

                    # Formato de jugadores
                    if (players == "") { players = "1" }

                    # Impresión de los 6 campos separados por PIPE (|)
                    print good_name "|" players "|" memory "|" rumble "|" transferidor "|" status_text
                }
            ' "$archivo_ini")
            
            # Si se obtuvieron datos, los usamos
            if [ -n "$datos_ini" ]; then
                echo "$datos_ini"
                return 0
            fi
        fi
    fi
    
    # Si no se encontró el INI o el MD5, regresamos los valores por defecto
    echo "$GOOD_NAME|$JUGADORES|$MEMORIA|$RETUMBE|$TRANSFERIDOR|$CLASIFICACION"
}

# --------------------------------------------------------------------------------
# --- FUNCIÓN 4: OBTENER ID RMG DEL LOOKUP ---
obtener_id_rmg() {
    local nombre_archivo_rom="$1"
    local archivo_lookup="$2"
    
    # 🚨 NOTA IMPORTANTE: La clave en el archivo de lookup (GoodName) no lleva extensión.
    # Eliminamos la extensión del nombre del archivo para buscar la clave.
    local nombre_base="${nombre_archivo_rom%.*}"

    if [ -f "$archivo_lookup" ]; then
        # Usamos grep para buscar la línea y awk para extraer el segundo campo
        # Utilizamos un patrón de búsqueda que excluye la comilla inicial para evitar falsos positivos
        local id_rmg=$(grep "\"$nombre_base\"" "$archivo_lookup" | head -n 1 | cut -d',' -f2 | tr -d '"')
        
        if [ -n "$id_rmg" ]; then
            echo "$id_rmg"
            return 0
        fi
    fi
    
    # Si no se encuentra, o no existe el archivo lookup
    echo ""
}

# --------------------------------------------------------------------------------
# --- FUNCIÓN 5: GENERAR LOOKUP RMG DEL BINARIO (Si existe el cache) ---
# Este paso extrae del archivo 'RomHeaderAndSettingsCache.cache' los pares GoodName, ID RMG.
# Asume que este archivo binario es el que genera mupen64plus.
generar_lookup_rmg() {
    local archivo_cache="$1"
    local archivo_lookup="$2"
    local num_entradas=0

    if [ -f "$archivo_cache" ]; then
        echo "⚙️ Generando archivo de lookup RMG (rmg_id_lookup.csv) del caché binario..."

        # 1. Creamos el archivo CSV de lookup con la cabecera
        echo "\"GoodName\",\"ID RMG\"" > "$archivo_lookup"

        # 2. Extraemos las cadenas de texto del binario que cumplen el patrón "GoodName,ID RMG"
        # La lógica de extracción es compleja, pero se basa en la suposición de que el par GoodName, ID_RMG
        # aparece en líneas separadas por caracteres no imprimibles o saltos de línea.
        # Usamos `strings` y un filtro para aislar las parejas.
        
        # Strings sin caracteres de control, que contienen al menos una letra/número y terminan en 4 caracteres
        # alfanuméricos (que suele ser el ID RMG) y una coma como separador de campo.
        # Esto es una heurística que puede requerir ajustes.
        strings "$archivo_cache" | grep -E '[A-Za-z0-9]+,[A-Z0-9]{4}$' | while read -r linea; do
            # Separar por la coma y envolver el GoodName en comillas.
            local good_name=$(echo "$linea" | cut -d',' -f1)
            local id_rmg=$(echo "$linea" | cut -d',' -f2)
            
            # Filtrar GoodNames muy cortos o sospechosos (heurística)
            if [ ${#good_name} -gt 3 ] && [ ${#id_rmg} -eq 4 ]; then
                echo "\"$good_name\",\"$id_rmg\"" >> "$archivo_lookup"
                num_entradas=$((num_entradas + 1))
            fi
        done
        
        echo "✅ Archivo de lookup RMG generado. Total de entradas: $num_entradas"
    else
        echo "⚠️ Archivo de caché RMG ($archivo_cache) no encontrado. Omitiendo generación de lookup."
    fi
    echo "---"
}


# --------------------------------------------------------------------------------
# --- FUNCIÓN PRINCIPAL ---
main() {
    
    # 1. INICIALIZACIÓN DEL CSV
    echo "$CABECERA_SOLICITADA" > "$archivo_csv"
    echo "📜 Archivo de metadatos CSV ('$archivo_csv') inicializado."
    echo "---"

    # 2. GENERACIÓN DEL ARCHIVO DE LOOKUP RMG
    generar_lookup_rmg "$archivo_cache_rmg" "$archivo_lookup_rmg"
    
    # 3. FASE 1: PROCESAMIENTO PRINCIPAL DE ROMS (Extracción de Headers y Configuración)
    echo "🛠️ Procesando ROMs en '$directorio_roms' (Fase 1: Extracción y Marcador)..."

    # Contamos el total de ROMs a procesar
    total_roms=$(find "$directorio_roms" -maxdepth 1 -type f -iname "*.n64" -o -iname "*.z64" | wc -l)
    contador=0

    # 🟢 MODIFICACIÓN CLAVE: Aplicar formato de 3 dígitos con ceros iniciales al TOTAL de ROMs
    total_roms_formateado=$(printf "%03d" "$total_roms")
    
    # Bucle sobre los archivos .n64 y .z64
    find "$directorio_roms" -maxdepth 1 -type f -iname "*.n64" -o -iname "*.z64" | while read -r archivo_rom; do
        
        # Obtener solo el nombre del archivo
        nombre_archivo=$(basename "$archivo_rom")
        
        # Extraemos la metadata binaria (ID Real, MD5, CRCs, etc.)
        metadata=$(extraer_metadata_rom "$archivo_rom" | tr -d '\n')
        
        # Si la extracción fue exitosa...
        if [ "$?" -eq 0 ]; then
            
            # A. Extracción de campos del header (primeros 10 campos del pipe)
            NOMBRE_INTERNO=$(echo "$metadata" | cut -d',' -f1)
            ID_REAL=$(echo "$metadata" | cut -d',' -f2)
            REGION_HEX=$(echo "$metadata" | cut -d',' -f3)
            REGION=$(echo "$metadata" | cut -d',' -f4)
            TAMANO=$(echo "$metadata" | cut -d',' -f5)
            ORDEN_BYTES=$(echo "$metadata" | cut -d',' -f6)
            EXTENSION=$(echo "$metadata" | cut -d',' -f7)
            MD5=$(echo "$metadata" | cut -d',' -f8)
            CRC1=$(echo "$metadata" | cut -d',' -f9)
            CRC2=$(echo "$metadata" | cut -d',' -f10)

            # B. Extracción de idiomas del nombre del archivo
            IDIOMAS_AUTO=$(extraer_idiomas_del_nombre "$nombre_archivo")

            # C. Búsqueda de configuraciones de hardware (MD5 -> INI)
            CONFIG_DATA_PIPE=$(obtener_config_ini "$MD5" "$archivo_ini")
            
            # Descomponemos los 6 campos de configuración del INI
            GOOD_NAME=$(echo "$CONFIG_DATA_PIPE" | cut -d'|' -f1) # No se usa en CSV
            JUGADORES=$(echo "$CONFIG_DATA_PIPE" | cut -d'|' -f2)
            MEMORIA=$(echo "$CONFIG_DATA_PIPE" | cut -d'|' -f3)
            RETUMBE=$(echo "$CONFIG_DATA_PIPE" | cut -d'|' -f4)
            TRANSFERIDOR=$(echo "$CONFIG_DATA_PIPE" | cut -d'|' -f5)
            CLASIFICACION=$(echo "$CONFIG_DATA_PIPE" | cut -d'|' -f6)
            
            # D. Búsqueda del ID RMG (Nombre del Archivo -> LOOKUP)
            ID_RMG=$(obtener_id_rmg "$nombre_archivo" "$archivo_lookup_rmg")

            # E. Escribimos los 19 campos en el orden final solicitado (usando comillas para CSV)
            echo "\"$nombre_archivo\",\"$NOMBRE_INTERNO\",\"$ID_REAL\",\"$ID_RMG\",\"$REGION\",\"$IDIOMAS_AUTO\",\"$JUGADORES\",\"$MEMORIA\",\"$RETUMBE\",\"$TRANSFERIDOR\",\"$CLASIFICACION\",\"\",\"\",\"$TAMANO\",\"$ORDEN_BYTES\",\"$EXTENSION\",\"$MD5\",\"$CRC1\",\"$CRC2\"" >> "$archivo_csv"
            
        fi # Fin del if de extracción exitosa
        
        # Incrementamos el contador
        contador=$((contador + 1))
        
        # 🟢 MODIFICACIÓN CLAVE: Simplificamos el formato del contador a una sola línea con printf
        contador_formateado=$(printf "%03d" "$contador")
        
        # Mostrar el progreso con el formato deseado
        echo "[$contador_formateado/$total_roms_formateado] -> $nombre_archivo"
    
    done # Fin del bucle principal
    
    echo "✅ Procesamiento de ROMs completado. Total de entradas: $total_roms"
    echo "---"

}

# Ejecución de la función principal
main

exit 0
