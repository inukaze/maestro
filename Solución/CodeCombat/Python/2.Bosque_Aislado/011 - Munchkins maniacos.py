# https://codecombat.com/play/level/maniac-munchkins?
# ¡Otro cofre en el campo para que el héroe lo abra!
# Ataca el cofre para romperlo.
# ¡Algunos munchkins no se quedarán de brazos cruzados mientras lo atacas!
# Defiéndete cuando un munchkin se acerca demasiado.

while True:
    enemy = hero.findNearestEnemy()
    distance = hero.distanceTo(enemy)
    if hero.isReady("cleave"):
	# Primera prioridad is que el escindir este listo :
        hero.cleave(enemy)
        pass
    elif distance < 5:
	# Atacar al munchkin que se acerca demasiado
        hero.attack(enemy)
        pass
    else:
	# De lo contrario, intenta abrir el cofre:
	# Usa el nombre del cofre para atacar: "Chest".
        hero.attack("Chest")
        pass
