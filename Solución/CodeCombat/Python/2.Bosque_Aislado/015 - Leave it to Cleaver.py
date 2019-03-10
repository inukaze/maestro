# https://codecombat.com/play/level/leave-it-to-cleaver?
#
# Esto muestra cómo definir una función llamada "EscindirCuandoSeAcerque"
# La función define un parámetro llamado `objetivo`
def EscindirCuandoSeAcerque(objetivo):
    if hero.distanceTo(objetivo) < 5:
        pass
        # Coloca tu codigo de ataque aqui
	# Si "escindir" (cleave) esta listo, entonces escindir al objetivo
        if hero.isReady("cleave"):
            hero.cleave(enemy)
	# De lo contrario, solo ataca al objetivo
        hero.attack(enemy)

# Este codigo no es parte de la funcion.
while True:
    enemy = hero.findNearestEnemy()
    if enemy:
	# Nota dentro de EscindirCuandoSeAcerque, nos referimos al "enemigo" como "objetivo"
        EscindirCuandoSeAcerque(enemy)
