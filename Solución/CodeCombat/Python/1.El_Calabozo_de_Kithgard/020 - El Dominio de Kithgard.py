#import webbrowser
#webbrowser.open('https://codecombat.com/play/level/kithgard-mastery?')
#
# Llega al final del laberinto usando los comandos de movimiento.
# Cuente el número de gemas recogidas, y luego diga el recuento actual cuando este cerca de una trampa de fuego para desactivarla.
# El cuervo en el inicio le dará una contraseña. Diga la contraseña cerca de una puerta para abrirla.
# Mata a los ogros cuando llegue cerca de ellos.
# Puedes utilizar loop para repetir todas las instrucciones según sea necesario.
# Si ganas este nivel, puedes saltar al mundo del bosque!
hero.moveRight(), hero.moveUp(2)
enemy = hero.findNearestEnemy()
hero.cleave(enemy)
hero.moveLeft(1), hero.moveUp(2)
hero.moveRight(2), hero.moveUp(1)
hero.moveDown(1), hero.moveRight(1)
hero.moveDown(2), hero.say("1")
hero.moveDown(2)
hero.say("Joshua"), hero.moveRight(3)
hero.moveUp(2)
enemy = hero.findNearestEnemy()
hero.cleave(enemy)
hero.moveLeft(1), hero.moveUp(2)
hero.moveRight(2), hero.moveUp(1)
hero.moveDown(1), hero.moveRight(1)
hero.moveDown(2), hero.say("2")
hero.moveDown(2), hero.say("Joshua")
hero.moveRight(2)