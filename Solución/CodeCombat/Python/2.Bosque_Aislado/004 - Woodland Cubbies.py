# https://codecombat.com/play/level/woodland-cubbies?
#
# Debes equipar : 
# 1. Unas gafas que concedan el codigo "findNearestEnemy"
# 2. un arma, que conceda el codigo "attack"
#
# Explora por el bosque, pero esté atento
# ¡Estos cubículos en el bosque pueden contener ogros!

hero.moveXY(19, 33)
enemy = hero.findNearestEnemy()
# La instrucción if verificará si una variable tiene un ogro.
# En caso de ser cierto, entonces atacar al enemigo 2 veces
if enemy:
    self.attack(enemy) * 2 

hero.moveXY(49, 51)
enemy = hero.findNearestEnemy()
if enemy:
    # Atacar al enemigo aqui:
    self.attack(enemy) * 2
    # pass no significa nada. Ayuda a cerrar sentencias if.
    pass

hero.moveXY(58, 14)
enemy = hero.findNearestEnemy()
# Usa una instrucción if para verificar si un enemigo existe :
if enemy:
    # Si existe un enemigo, atacarlo:
    self.attack(enemy) * 2
    pass
