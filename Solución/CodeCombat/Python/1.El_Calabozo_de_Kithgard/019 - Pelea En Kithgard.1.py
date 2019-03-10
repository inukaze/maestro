#import webbrowser
#webbrowser.open('https://codecombat.com/play/level/kithgard-brawl?')
#
# Sobrevive las oleadas de ogros.
# Si ganas, el nivel se hace más difícil, y da mayores recompensas.
# Si pierdes, debes esperar un día para re-enviar.
# Cada vez que envías se generan nuevas condiciones aleatorias.
loop:
    enemy = hero.findNearestEnemy()
    item = hero.findNearestItem()
    if enemy:
        distance = 4
        hero.attack(enemy)
        hero.shield()
    if item:
        self.findNearestItem()
    if enemy:
        distance = hero.distanceTo(enemy)
        hero.shield()
        distance = 1 and hero.isReady('cleave')
        hero.cleave(enemy)
