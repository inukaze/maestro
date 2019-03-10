# https://codecombat.com/play/level/blind-distance?
# Dile al hechicero la distancia de los ogros entrantes

# Esta funcion encuentra al enemigo cercano y devuelve la distancia hacia el.
# Si no hay enemigo, la funcion devuelve 0.
def DistanciaDeEnemigoCercano():
    Enemigo = hero.findNearestEnemy()
    Resultado = 0
    if Enemigo:
        Resultado = hero.distanceTo(Enemigo)
    return Resultado

while True:
    # Llamar a la funcioncion DistanciaDeEnemigoCercano() y
    # Guarda el resultado en la variable DistanciaEnemiga
    DistanciaEnemiga = DistanciaDeEnemigoCercano()
    # Si la DistanciaEnemiga es mayor que 0:
    if DistanciaEnemiga > 0:
	# Decir el valor de la variable DistanciaEnemiga
        hero.say(DistanciaEnemiga)
