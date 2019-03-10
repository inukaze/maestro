#https://codecombat.com/play/level/peasant-protection?

while True:
    enemy = hero.findNearestEnemy()
    distance = hero.distanceTo(enemy)
    if distance < 10:
        # Ataca si se acercan demasiado al campesino.
        self.attack(enemy) * 2
        pass
    # De lo contrario, ¡quédate cerca del campesino¡ Usa else
    hero.moveXY(40, 37)
