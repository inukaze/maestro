# https://codecombat.com/play/level/backwoods-fork?
# ¡Ogros entrantes!
# Usa la función VerificarParaAtacar para hacer que el código sea fácil de leer.

# Esta función tiene un parámetro.
# Un parámetro es una forma de pasar información a una función.
def VerificarParaAtacar(objetivo):
    # ¡El parámetro 'objetivo' es solo una variable!
    # Contiene el argumento cuando se llamó a la función.
    if objetivo:
        hero.attack(objetivo)
    hero.moveXY(43, 34)

while True:
    hero.moveXY(58, 52)
    EnemigoSuperior = hero.findNearestEnemy()
    VerificarParaAtacar(EnemigoSuperior)
    # Mover a la marca X inferior.
    hero.moveXY(58, 15)
    # Crea una variable llamada EnemigoInferior y encuentra al enemigo más cercano.
    EnemigoInferior = hero.findNearestEnemy()
    # Usa la funcion VerificarParaAtacar, e incluye la variable EnemigoInferior.
    VerificarParaAtacar(EnemigoInferior)
