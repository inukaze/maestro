#import webbrowser
#webbrowser.open('https://codecombat.com/play/level/known-enemy?')
#
loop:
    Enemigo = hero.findNearestEnemy()
    self.attack(Enemigo) * 2