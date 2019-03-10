# https://codecombat.com/play/level/mind-the-trap?
# Debes equipar : "Espada Larga"
#
# Si intenta atacar a un enemigo distante, su héroe cargará hacia él, ignorando todas las banderas.
# ¡Tendrás que asegurarte de que solo atacas a los enemigos que están cerca tuyo!
while True:
    Bandera = hero.findFlag()
    Enemigo = hero.findNearestEnemy()
    Distancia = hero.distanceTo(Enemigo)   
    if Bandera:
	# Recoger la bandera.
        hero.say("Yo deberia recoger la bandera.")
	hero.pickUpFlag(Bandera)
    elif Enemigo:
        # Solo atacar si el enemigo esta a menos de 10 metros
	if Distancia < 10:
            hero.attack(Enemigo)
