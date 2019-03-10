# https://codecombat.com/play/level/passing-through?
# No insultes a esta tribu de ogros pacíficos.
while True:
    Objeto = hero.findNearestItem()
    if Objeto:
        # Si Objeto.type NO ES IGUAL A "gem"
        if Objeto.type != "gem":
	    # Entonces sigue a tu lobo mascota
            hero.moveXY(pet.pos.x, pet.pos.y)
	    # De lo contrario | Else:
        else:
	    # Ir a la posicion de la gema.
            hero.moveXY(Objeto.pos.x, Objeto.pos.y)
