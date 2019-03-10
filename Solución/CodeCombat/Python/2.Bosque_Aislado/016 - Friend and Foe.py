# https://codecombat.com/play/level/friend-and-foe?
# Campesinos y peones se están reuniendo en el bosque.
# ¡Dirige a los campesinos a la batalla y los peones se van!

while True:
    amigo = hero.findNearestFriend()
    if amigo:
        hero.say("Al combate, " + amigo.id + "!")
    # Ahora busca al enemigo más cercano y diles que se vaya.
    enemigo = hero.findNearestEnemy()
    if enemigo:
	hero.say("Vete, " + enemigo.id + "!")
