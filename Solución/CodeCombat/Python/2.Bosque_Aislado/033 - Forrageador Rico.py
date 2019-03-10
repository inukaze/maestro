# https://codecombat.com/play/level/rich-forager?
# Usa  "if" y "else if"  para manipular cualquier situación.
# ¡Ensambla todo para derrotar los enemigos y tomar las monedas!
# ¡Asegúrate de comprar una buena armadura en la tienda de cosas! 400 de vida es lo recomendable.

while True:
    Bandera = hero.findFlag()
    Enemigo = hero.findNearestEnemy()
    Objeto = hero.findNearestItem()
    if Bandera:
        # ¿Qué pasa cuando encuentro una Bandera?
        hero.pickUpFlag(Bandera)
    elif Enemigo:
        # ¿Qué pasa cuando encuentro un Enemigo?
        hero.attack(Enemigo)
    elif Objeto:
        # ¿Qué pasa cuando encuentro un Objeto?
        PosicionObjeto = Objeto.pos
        ObjetoX = PosicionObjeto.x
        ObjetoY = PosicionObjeto.y
        hero.moveXY(ObjetoX, ObjetoY)
