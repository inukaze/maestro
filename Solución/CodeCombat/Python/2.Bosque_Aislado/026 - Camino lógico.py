# https://codecombat.com/play/level/logical-path?
# Obtenér dos valores secretos true / false del mago.
hero.moveXY(14, 24)
SecretoA = hero.findNearestFriend().getSecretA()
SecretoB = hero.findNearestFriend().getSecretB()

# Si tanto el SecretoA como SecretoB son verdaderos, ir por el camino alto; De lo contrario, tomar el camino bajo.
# Consultá la guía para obtener notas sobre cómo escribir expresiones lógicas.
SecretoC = SecretoA and SecretoB
if SecretoC:
    hero.moveXY(20, 33)
else:
    hero.moveXY(20, 15)
    pass
hero.moveXY(26, 24)

# Si un SecretoA o SecretoB es verdadero, tomá el camino alto.
if SecretoA or SecretoB == True:
    hero.moveXY(32, 33)
else:
    hero.moveXY(32, 15)
    pass
hero.moveXY(38, 24)

# Si secretB no es verdadero, toma el camino Alta.
if SecretoB == False:
    hero.moveXY(44, 33)
else:
    hero.moveXY(44, 15)
    pass
hero.moveXY(50, 24)
