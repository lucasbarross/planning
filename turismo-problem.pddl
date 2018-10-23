(define (problem pontos-turisticos)
  (:domain recife)
  (:objects igreja praca-republica mercado paco-alfandega banco-brasil - lugar
  			bike-republica bike-diario bike-mercado bike-santa-rita bike-alfandega bike-apolo - lugar 
  			joao maria jose - pessoa
			bike-1 bike-2 bike-3 bike-4 bike-5 bike-6 bike-7 bike-8 - bicicleta
	)
  (:init 
  		(adjBike bike-diario bike-mercado) (adjBike bike-mercado bike-diario )  
  		(adjBike bike-diario bike-santa-rita) (adjBike bike-santa-rita bike-diario) 
		(adjBike bike-diario bike-republica) (adjBike bike-republica bike-diario)
		(adjBike bike-republica bike-apolo) (adjBike bike-apolo bike-republica) 
		(adjBike bike-apolo bike-alfandega) (adjBike bike-alfandega bike-apolo)
		(adjBike bike-alfandega bike-santa-rita) (adjBike bike-santa-rita bike-alfandega)
		(adjBike bike-santa-rita bike-mercado) (adjBike bike-mercado bike-santa-rita)

		(adjWalk bike-republica praca-republica) (adjWalk praca-republica bike-republica)
		(adjWalk bike-diario igreja) (adjWalk igreja bike-diario)
		(adjWalk bike-mercado mercado) (adjWalk mercado bike-mercado)
		(adjWalk bike-alfandega paco-alfandega) (adjWalk paco-alfandega bike-alfandega)
		(adjWalk bike-apolo banco-brasil) (adjWalk banco-brasil bike-apolo)

		(bikeAt bike-1 bike-mercado)
		(bikeAt bike-2 bike-mercado)
		(bikeAt bike-3 bike-santa-rita)
		(bikeAt bike-4 bike-santa-rita)
		(bikeAt bike-5 bike-santa-rita)
		(bikeAt bike-6 bike-diario)
		(bikeAt bike-7 bike-republica)
		(bikeAt bike-8 bike-apolo)

		(personAt joao bike-diario)
		(personAt maria bike-alfandega)
		(personAt jose bike-apolo)

		(isPonto igreja)
		(isPonto praca-republica)
		(isPonto mercado)
		(isPonto paco-alfandega)
		(isPonto banco-brasil)

		(canGetBike joao)
		(canGetBike maria)
		(canGetBike jose)

		(hasSubobjective joao)
		(subobjective joao banco-brasil)

		(hasToMeetSomeone jose mercado)
		(hasToMeetSomeone maria mercado)
		(hasToMeet jose maria mercado)
  )
  (:goal 
  	(and (hasBeen joao banco-brasil) (hasBeen joao paco-alfandega) (hasBeen jose praca-republica) (hasBeen jose mercado) (hasBeen maria igreja) (hasBeen maria mercado) 
	  	 (not(withBike joao)) (not(withBike jose)) (not(withBike maria))
	)
  )
)
