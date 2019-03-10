# https://codecombat.com/play/level/the-mighty-sand-yak?
# Deja que los yaks se acerquen, luego mueve 10 m a la derecha para esquivar.
# Esquiva 4 yaks para completar el nivel.

while True:
    # Obtén la posición x & y actual del héroe.
    x = hero.pos.x
    y = hero.pos.y
    
    # Encuentra al yak más cercano.
    yak = hero.findNearestEnemy()
    
    # Si la distancia al yak es menor a 10:
    if hero.distanceTo(yak) < 10:
        # Para mover hacia la derecha, suma 10 a la posición x del héroe.
        x = x + 10
        # Usa moveXY(x, y) para moverte!
        hero.moveXY(x, y)
