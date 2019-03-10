#import webbrowser
#webbrowser.open('https://codecombat.com/play/level/kithgard-gates?')
#
# Costruye 3 vallas para mantener a los ogros acorralados!

self.moveDown()
self.buildXY("fence", 36, 34)
self.buildXY("fence", 36, 30)
self.buildXY("fence", 36, 26)
self.moveRight(4)