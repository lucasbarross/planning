(define (domain recife)
  (:requirements [:strips] [:typing] )
  ; entidade pode ser: Pessoa ou Bicicleta
  (:types pessoa bicicleta lugar )
  (:predicates 
   (adjWalk ?estacao - lugar ?atracao - lugar)
   (adjBike ?estacao - lugar ?estacao - lugar)
   (personAt ?quem - pessoa ?onde - lugar)
   (bikeAt ?qual - bicicleta ?onde - lugar)
   (hasBeen ?quem - pessoa ?onde - lugar)
   (hasBike ?quem - pessoa ?bicicleta - bicicleta)
   (withBike ?quem - pessoa)
   (canGetBike ?quem - pessoa)
   (expiredTime ?bicicleta)
  )
  
  (:action pegar-bicicleta
    :parameters (?quem - pessoa ?bicicleta - bicicleta ?onde - lugar)
    :precondition (and (not (withBike ?quem)) (bikeAt ?bicicleta ?onde) (personAt ?quem ?onde) (canGetBike ?quem))
    :effect (and (withBike ?quem) (hasBike ?quem ?bicicleta) (not (bikeAt ?bicicleta ?onde)))
  )

  (:action entregar-bicicleta
      :parameters (?quem - pessoa ?bicicleta - bicicleta ?onde - lugar)
      :precondition (and (withBike ?quem) (bikeAt ?bicicleta ?onde) (personAt ?quem ?onde) (hasBike ?quem ?bicicleta))
      :effect (and (not (withBike ?quem)) (not (hasBike ?quem ?bicicleta)) (bikeAt ?bicicleta ?onde) (not (canGetBike ?quem)) (not ( expiredTime ?bicicleta) ))
  )
  
  (:action esperar5min
      :parameters (?quem - pessoa)
      :precondition (and (not (withBike ?quem)))
      :effect (and (canGetBike ?quem))
  )
  
  (:action caminhar
      :parameters (?quem - pessoa ?lugar1 - lugar ?lugar2 - lugar)
      :precondition (and (personAt ?quem ?lugar1) (not (withBike ?quem)) (adjWalk ?lugar1 ?lugar2))
      :effect (and (not (personAt ?quem ?lugar1)) (personAt ?quem ?lugar2))
  )

  (:action visitar-ponto
      :parameters (?quem - pessoa ?atracao - lugar)
      :precondition (and (personAt ?quem ?atracao))
      :effect (and (hasBeen ?quem ?atracao) (canGetBike ?quem))
  )
  
  (:action pedalar
      :parameters (?quem - pessoa ?bicicleta - bicicleta ?estacao1 - lugar ?estacao2 - lugar)
      :precondition (and (adjbike ?estacao1 ?estacao2) (personAt ?quem ?estacao1) (withBike ?quem) (hasBike ?quem ?bicicleta) (not (expiredTime ?bicicleta)))
      :effect (and (not (personAt ?quem ?estacao1)) (personAt ?quem ?estacao2) (expiredTime ?bicicleta) (bikeAt ?bicicleta ?estacao2))
  )
)