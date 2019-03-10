# Ataca munchkins, llamar a los alboratadores e ignorar a los burls. Esta funcion define el comportamiento del Hero acerca de los enemigos
Enemigo = hero.findNearestEnemy()
def TratoEnemigo(Enemigo):
    # Si el enemigo es tipo "munchkin":
    if Enemigo.type is "munchkin":
        # Entonces atacarlo:
        hero.attack(Enemigo)
    # Si el enemigo es del tipo "alborotador":
    if Enemigo.type is "brawler":
        # Entonces di algo para atraer al alboratador:
        hero.say("alborotador que es lo que menor!")
    pass

while True:
    Enemigo = hero.findNearestEnemy()
    if Enemigo:
        TratoEnemigo(Enemigo)
    else:
        hero.moveXY(30, 34)
