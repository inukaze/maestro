# https://codecombat.com/play/level/hit-and-freeze?
# Estas atrapado. No te muevas, sera doloroso.

# Encuentra al enemigo cercano y guardalo en una variable.
Enemigo = hero.findNearestEnemy()

# Medir la distancia al enemigo cercano y guardarla en una variable.
Distancia = hero.distanceTo(Enemigo)

# Esta funcion verifica si el enemigo esta en tu rango de ataque.
def EnRangoDeAtaque():
    # Casi todas las espadas tienen un rango de 3.
    if Distancia <= 3:
        return True
    else:
        return False

# Ataca a los ogros solo cuando estén al alcance.
while True:
    # Llamar a la funcion EnRangoDeAtaque(Enemigo), con el enemigo como argumento y guarda el resultado en la variable PuedoAtacar.
    EnRangoDeAtaque(Enemigo)
    PuedoAtacar = EnRangoDeAtaque(Distancia)
    # Si el resultado almacenado en PuedoAtacar es Verdadero, ¡Ataca!
    if Distancia == True:
	hero.attack(Enemigo)    
	pass
