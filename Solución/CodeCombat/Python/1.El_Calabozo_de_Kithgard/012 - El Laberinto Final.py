#import webbrowser
#webbrowser.open('https://codecombat.com/play/level/the-final-kithmaze?')
#
while True:
    self.moveRight()
    self.moveUp()
    enemy = self.findNearestEnemy()
    self.moveRight()
    self.attack(enemy)
    self.attack(enemy)
    self.moveDown(2)
    self.moveUp()
