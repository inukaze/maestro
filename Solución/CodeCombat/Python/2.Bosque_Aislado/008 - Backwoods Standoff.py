# https://codecombat.com/play/level/backwoods-standoff?
# Los Munchkins estan atacando!
# Los enjambres vendrán a intervalos regulares.
# Siempre que puedas, escóndete para despejar la masa de enemigos.

while True:
    enemy = hero.findNearestEnemy()
    # Usa un enunciado if con isReady para marcar "escindir" (cleave):
    if hero.isReady("cleave"):
        # Escindir!
        hero.cleave(enemy)
    # En caso contrario, si "Escindir" no esta listo:
    else:
        # Atacar al ogro más cercano!
        hero.attack(enemy)