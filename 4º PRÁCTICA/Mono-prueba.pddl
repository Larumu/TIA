(define (problem monoprob1234)

(:domain Mono-solution)

(:objects 
	room1 - room
	room2 - room
	room3 - room
	room4 - room
	room5 - room
	room6 - room
	monkey0 - monkey
	banana0 - banana
	glass0 - glass
	scissors0 - scissors
	glass0 - glass
	fuente0 - fuente
	box0 - box
	zero - numbernegative
	five - numberpositive
	)

(:init
	(can_move room1 room2)
	(can_move room2 room1)
	(can_move room2 room3)
	(can_move room3 room2)
	(can_move room3 room4)
	(can_move room4 room3)
	(can_move room2 room5)
	(can_move room5 room2)
	(can_move room3 room6)
	(can_move room6 room3)
	(fuente_in fuente0 room6)
	(banana_in banana0 room2)
	(scissors_in scissors0 room5)
	(glass_in glass0 room1)
	(box_in box0 room6)
	(monkey_at room1 monkey0)
	(glass_with_water zero)
	(glass_should_have five)
	(= (moving-time) 2)
	(= (picking-objects-time) 1)
	(= (picking-banana-time) 5)
	(= (fulling-glass-time) 3)
	(= (drink-and-eat-time) 3)
	(= (glass-capacity) 5)
	(= (constant-no-1) 1)
	)


(:goal (and(monkey_has_drunk glass0)(monkey_has_eaten banana0))
		)

(:metric minimize (total-time))

)
