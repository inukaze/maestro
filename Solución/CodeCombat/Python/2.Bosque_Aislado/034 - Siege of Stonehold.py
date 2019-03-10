# https://codecombat.com/play/level/siege-of-stonehold?
# Ayuda a tus amigos a vencer a los minions que Thoktar envía contra ti.
# Necesitarás un gran equipo y estrategia para ganar.
# Las banderas podrían ayudar, pero depende de ti, ¡se creativo!
# Hay un doctor detrás de la valla. ¡Muévete a la X para curarte!

# Nota : Para este nivel compre el objeto : "Piedra Pulida Al Tacto" (x54 Gemas Azules)
# Concede Codigo : pos, health, maxHealth
# Lo cual en caso de no querer usar las banderas, necesitare para que vaya a la X a curarse.

while True:
    Enemigo = hero.findNearestEnemy()
    Verde = hero.findFlag("green")
    Negro = hero.findFlag("black")
    Violeta = hero.findFlag("violet")
    Salud = hero.health
    if Salud < 176:
        hero.moveXY(19, 69)
    pass #fi
    if Verde:
        hero.pickUpFlag(Verde)
    elif Negro:
        hero.pickUpFlag(Negro)
    elif Violeta:
        hero.pickUpFlag(Violeta)
    elif Enemigo:
        hero.attack(Enemigo)
        Distancia = hero.distanceTo(Enemigo)
        if Distancia < 10 and hero.isReady("cleave"):
	        hero.cleave(Enemigo)
