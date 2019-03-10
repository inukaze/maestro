# https://codecombat.com/play/level/salted-earth?
# ¡Los Ogros están atacando un asentamiento cercano!
# Ten cuidado, sin embargo, Los ogros han sembrado el suelo con veneno.
# ¡Recoge monedas y derrota a los ogros, pero evita las púas y el veneno!

while True:
    Enemigo = hero.findNearestEnemy()
    if Enemigo.type == "munchkin" or Enemigo.type == "thrower":
	    hero.attack(Enemigo)
    pass
    # ¡Comprueba el tipo de elemento para asegurarte de que el héroe no recoge el veneno!
    # Busca los tipos: Gema('gem') & Moneda('coin')
    Objeto = hero.findNearestItem()
    if Objeto.type == "gem" or Objeto.type == "coin":
	hero.moveXY(Objeto.pos.x, Objeto.pos.y)
