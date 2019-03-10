#https://codecombat.com/play/level/endangered-burl?
# Solo atacar enemigos del tipo "munchkin" y "lanzeros"
# No ataqus a "burl". Huye lejos de un "Ogro"
while True:
    enemy = hero.findNearestEnemy()
    
    # Recuerda: No atacar a "burl"!
    if enemy.type == "burl":
        hero.say("No atacare a Burl!")
    
    # el tipo ("type") indica que clase de criatura es.
    if enemy.type == "munchkin":
        hero.attack(enemy)
    
    # Usa un "Si" para atacar a un "Lanzero" (thrower).
    if enemy.type == "thrower":
        hero.attack(enemy)
    
    # Si esta un "ogro" (ogre), usa moveXY para huir a la entrada de la villa
    if enemy.type == "ogre":
        hero.moveXY(21, 45)
        hero.moveXY(41, 47)
