# https://codecombat.com/play/level/forest-fire-dancing?
# En este nivel, el evilstone es malo! Evitelos caminando hacia la otra dirección.
while True:
    evilstone = hero.findNearestItem()
    if evilstone:
        pos = evilstone.pos
        if pos.x == 34:
            # Si el evilstone está a la izquierda, vaya a la derecha.
            hero.moveXY(46, 22)
            pass
        else:
            # Si el evilstone está a la derecha, vaya a la izquierda.
            hero.moveXY(34, 22)
            pass
    else:
        # Si no hay evilstone, ir al centro.
        hero.moveXY(40, 22)
        pass
