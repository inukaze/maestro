# https://codecombat.com/play/level/usual-day?
# Derrota a los munchkins, recoge las monedas, Todo como de costumbre
# Usa Y(AND) para verificar la existencia y escribe una declaración.

while True:
    Enemigo = hero.findNearestEnemy()
    # Con Y(AND), el type solo se verifica si el enemigo existe.
    if Enemigo and Enemigo.type == "munchkin":
        hero.attack(Enemigo)
    # Encuentra el artículo más cercano.
    Articulo = hero.findNearestItem()
    # Recoge el artículo si existe y su tipo es "moneda"(coin).
    if Articulo and Articulo.type == "coin":
	hero.moveXY(Articulo.pos.x, Articulo.pos.y)
