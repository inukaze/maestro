# https://codecombat.com/play/level/spring-thunder?
# Ciertas monedas y gemas atraen rayos.
# El héroe solo debe agarrar monedas de plata y gemas azules.

while True:
    Objeto = hero.findNearestItem()
    # Una moneda de plata tiene un valor de 2.
    # Recolectar si Objeto.type es igual a "coin"
    # Y Objeto.value es igual a 2
    if Objeto.type == "coin" and Objeto.value == 2:
        hero.moveXY(Objeto.pos.x, Objeto.pos.y)
    # Una gema azul tiene un valor de 10.
    # Recolectar si Objeto.type es igual a "gem"
    # Y Objeto.value es igual a 10.
    if Objeto.type == "gem" and Objeto.value == 10:
	hero.moveXY(Objeto.pos.x, Objeto.pos.y)
