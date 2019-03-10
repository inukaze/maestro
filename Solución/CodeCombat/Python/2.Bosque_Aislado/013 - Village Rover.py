# https://codecombat.com/play/level/village-rover?
# Esto define una funciona llamada "Encontrar_y_AtacarEnemigo"
def Encontrar_y_AtacarEnemigo():
    enemy = hero.findNearestEnemy()
    if enemy:
        hero.attack(enemy)

# Esto codigo no es parte de la funcion.
while True:
    # Ahora puedes patrullar la aldea usando Encontrar_y_AtacarEnemigo
    hero.moveXY(35, 34)
    Encontrar_y_AtacarEnemigo()
    # Ahora ve hacia la entrada de la derecha
    hero.moveXY(60, 31)
    # Usa Encontrar_y_AtacarEnemigo()
    Encontrar_y_AtacarEnemigo()
