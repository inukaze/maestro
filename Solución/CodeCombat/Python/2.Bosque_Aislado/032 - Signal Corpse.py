# https://codecombat.com/play/level/signal-corpse?
# Puedes usar banderas para elegir diferentes tácticas.
# En este nivel, la bandera verde significará que deseas moverte a la bandera.
# La bandera negra significa que desea encindin en la bandera
# El médico te curará en la X Roja
while True:
    Verde = hero.findFlag("green")
    Negro = hero.findFlag("black")
    Cercano = hero.findNearestEnemy()    
    if Verde:
        hero.pickUpFlag(Verde)
    elif Negro and hero.isReady("cleave"):
        hero.pickUpFlag(Negro)
        # Escindir!
        hero.cleave(Cercano)
    elif Cercano and hero.distanceTo(Cercano) < 10:
        # Atacar!
        hero.attack(Cercano)
