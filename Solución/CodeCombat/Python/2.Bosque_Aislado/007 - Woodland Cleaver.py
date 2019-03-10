# https://codecombat.com/play/level/woodland-cleaver?
#
# Primero debes equipar
# 1. Reloj de Pulsera Solar -> Concede Codigo "isReady"
# 2. Espada Larga -> Concede Codigo "attack","cleave
#
# Usa tu nueva habilidad "cleave", tan a menudo como puedas.

hero.moveXY(23, 23)
while True:
    enemy = hero.findNearestEnemy()
    if hero.isReady("cleave"):
        # Rompe a los enemigos
        self.cleave(enemy)
        pass
    else:
        #De lo contrario (en caso de que la habilidad "cleave" no este lista), hacer un ataque normal.
        self.attack(enemy) * 2
        pass
