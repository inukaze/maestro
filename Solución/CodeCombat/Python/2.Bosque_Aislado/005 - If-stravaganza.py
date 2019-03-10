# https://codecombat.com/play/level/if-stravaganza?
#
# Debes Comprar & Equipar: 
# 1. Reloj de Pulsera Simple
# 2. Programática II
#
# ¡Derrota a los ogros desde dentro de su propio campamento!
while True:
    enemy = hero.findNearestEnemy()
    # Usa la sentencia if para comprobar si existe un enemigo
    # Ataca al enemigo si existe:
    if enemy:
        hero.attack(enemy) * 2
