# https://codecombat.com/play/level/range-finder?
#
# Debes equipar -> Condecen : Rango+5. Codigo : "distanceTo","findNearestEnemy","findNearestItem"
#
# ¡Los ogros están explorando el bosque!
# ¡Usa el método distanceTo para encontrar dónde están los enemigos.!
# ¡Di la distancia de cada enemigo para decirle a la artillería dónde disparar!

enemy1 = "Gort"
distance1 = hero.distanceTo(enemy1)
hero.say(distance1)

enemy2 = "Smasher"
distance2 = hero.distanceTo(enemy2)
# Di el valor de la variable "distance2"!
hero.say(distance2)

# Encuentra y di la distancia del resto de los enemigos :
# No dispares a tus amigos
friend3 = "Charles"

enemy3 = "Gorgnub"
distance3 = hero.distanceTo(enemy3)
hero.say(distance3)
