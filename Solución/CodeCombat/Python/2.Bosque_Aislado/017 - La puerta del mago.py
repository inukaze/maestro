#https://codecombat.com/play/level/the-wizards-door?
# Llega hasta 'Laszlo" y obten su numero secreto.
hero.moveXY(30, 13)
las = hero.findNearestFriend().getSecret()

# Suma 7 al numero de 'Laszlo' para obtener el numero de 'Erzsebet'
# Llega hasta 'Erzsebet' y dile su numero magico.
erz = las + 7
hero.moveXY(17, 26)
hero.say(erz)

# Divide el numero de 'Erzsebet' entre 4 para obtener el numero de 'Simonyi'
# Ve hasta 'Simonyi' y dile su numero.
simonyi = erz / 4
hero.moveXY(30, 39)
hero.say(simonyi)

# Multiplica el numero de 'Simonyi' por el de 'Laszlo' para obtener el numero de 'Agata'
# Ve hasta 'Agata y dile su numero.
agata = simonyi * las
hero.moveXY(43, 27)
hero.say(agata)
