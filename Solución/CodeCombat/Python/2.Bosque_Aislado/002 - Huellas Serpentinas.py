# https://codecombat.com/play/level/winding-trail?

# Ve hasta el final del camino y construye una cerca en la X
# Usa la funcion : moveXY(x, y)

# Es el primer punto en la ruta
hero.moveXY(36, 59)
# Moverse al siguiente punto en la ruta
hero.moveXY(37, 12)
hero.moveXY(73, 63)

enemy = hero.findNearestEnemy()
if enemy:
    hero.shield(enemy)
    
hero.moveXY(72, 21)
# Construir una cerca para detener al ogro
hero.buildXY("fence", 72, 25)