(define (domain Mono-solution)
(:requirements :durative-actions :typing :fluents)
(:types monkey room banana scissors glass fuente box numberpositive numbernegative)

(:predicates (can_move ?r1 - room ?r2 - room)
			 (fuente_in ?f - fuente ?r - room)	
			 (banana_in ?b - banana ?x - (either monkey room))
			 (scissors_in ?s - scissors ?x - (either monkey room))
			 (glass_in ?g - glass ?x - (either monkey room))
			 (box_in ?b - box ?x - (either monkey room))
			 (monkey_at ?r - room ?m - monkey)
			 (monkey_has_drunk ?g - glass)
			 (monkey_has_eaten ?b - banana)
			 (glass_with_water ?x -(either numberpositive numbernegative))
			 (glass_should_have ?p - numberpositive)

)

(:functions (moving-time)
			(picking-objects-time)
			(picking-banana-time)
			(fulling-glass-time)
			(drink-and-eat-time)
			(glass-capacity)
			(constant-no-1)


)

(:durative-action monkey-moves
	:parameters (?r1 - room ?r2 - room ?m - monkey)
	:duration (= ?duration (moving-time))
	:condition (and (over all (can_move ?r1 ?r2)) (at start (monkey_at ?r1 ?m)))
	:effect (and (at start (not(monkey_at ?r1 ?m))) (at end (monkey_at ?r2 ?m))  )
)

(:durative-action monkey-take-glass
	:parameters (?r - room ?g - glass ?m - monkey)
	:duration (= ?duration (picking-objects-time))
	:condition (and (at start (monkey_at ?r ?m)) (at start (glass_in ?g ?r)))
	:effect (and (at start (not(glass_in ?g ?r))) (at end (glass_in ?g ?m)) )
	)

(:durative-action monkey-take-box
	:parameters (?r - room ?m - monkey ?b - box)
	:duration (= ?duration (picking-objects-time))
	:condition (and (over all (monkey_at ?r ?m)) (at start (box_in ?b ?r)) )
	:effect (and (at start (not(box_in ?b ?r))) (at end (box_in ?b ?m)) )
	)


(:durative-action monkey-take-scissors
	:parameters (?s - scissors ?r - room ?m - monkey)
	:duration (= ?duration (picking-objects-time))
	:condition (and (over all (monkey_at ?r ?m)) (at start (scissors_in ?s ?r)) )
	:effect (and (at start (not(scissors_in ?s ?r))) (at end (scissors_in ?s ?m)) )
	)

(:durative-action monkey-full-the-glass
	:parameters (?g - glass ?r - room ?m - monkey ?f - fuente ?z - numbernegative ?p - numberpositive)
	:duration (= ?duration (fulling-glass-time))
	:condition (and (over all (monkey_at ?r ?m)) (over all (glass_should_have ?p)) (over all (fuente_in ?f ?r)) 
	(over all (glass_in ?g ?m)) (at start (glass_with_water ?z) ) )
	:effect (and (at start (not(glass_with_water ?z))) (at end (glass_with_water ?p)) )
	)

(:durative-action monkey-take-bananas
	:parameters (?b - banana ?b1 - box ?r - room ?s - scissors ?m - monkey)
	:duration (= ?duration (picking-banana-time))
	:condition (and (over all (monkey_at ?r ?m)) (at start (banana_in ?b ?r)) (over all (box_in ?b1 ?m)) (over all (scissors_in ?s ?m)) )
	:effect (and (at start (not(banana_in ?b ?r))) (at end (banana_in ?b ?m)) )
	)

(:durative-action monkey-drinks
	:parameters (?g - glass ?f - fuente ?r - room ?m - monkey ?p -numberpositive)
	:duration (= ?duration (drink-and-eat-time))
	:condition (and (over all (glass_in ?g ?m)) (at start (glass_with_water ?p) ))
	:effect (at end (monkey_has_drunk ?g))
	)

(:durative-action monkey-eats
	:parameters (?r - room ?b - banana ?m - monkey)
	:duration (= ?duration (drink-and-eat-time))
	:condition (over all  (banana_in ?b ?m))
	:effect (at end (monkey_has_eaten ?b))
	)






)
