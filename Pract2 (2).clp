(deftemplate temperatura -20 50 grados
	(
	(frio (-20 1)(10 1)(20 0))
	(templado (10 0)(15 1)(25 1)(30 0))
	(caliente (25 0)(30 1))
	)
	)

(deftemplate humedad 0 100 hum
	(
	(seco (0 1)(20 1)(30 0))
	(humedo (25 0)(35 1)(60 1)(75 0))
	(mojado (70 0)(80 1))
	)
	)

(deftemplate velocidad 0 10 grado
	(
	(bajo (0 1)(2 1)(4 0))
	(medio (3 0)(4 1)(6 1)(8 0))
	(alto (7 0)(8 1))
	)
	)

(deftemplate estacion 0 50 grados
	(
	(invierno (0 1)(10 1)(20 0))
	(otono (10 0)(15 1)(20 1)(25 0))
	(primavera (10 0)(20 1 )(25 1)(30 0))
	(verano (20 0)(30 1))
	
	))

(deftemplate ventilador
	(slot ventiladorid (type SYMBOL))
	(slot temperatura (type INTEGER)) 
	(slot humedad (type INTEGER))
	(slot velocidad (type INTEGER))
	(slot evaluado (type SYMBOL))
	)


(deffunction fuzzify (?fztemplate ?value ?delta)
 (bind ?low (get-u-from ?fztemplate))
 (bind ?hi (get-u-to ?fztemplate))
 (if (<= ?value ?low)
	then
		(assert-string
			(format nil "(%s (%g 1.0) (%g 0.0))" ?fztemplate ?low ?delta))
	else
		(if (>= ?value ?hi)
			then
				(assert-string
					(format nil "(%s (%g 0.0) (%g 1.0))"
								?fztemplate (- ?hi ?delta) ?hi))
			else
				(assert-string
					(format nil "(%s (%g 0.0) (%g 1.0) (%g 0.0))"
						?fztemplate (max ?low (- ?value ?delta))
						?value (min ?hi (+ ?value ?delta))))
	)))
(defrule fusificar 
	(declare (salience 10))
	?h <- (ventilador (temperatura ?temp) (humedad ?hum) (evaluado no))
	=>
	(bind ?temp1 ?temp)
	(bind ?hum1 ?hum)
	(fuzzify temperatura ?temp1 0.1)
	(fuzzify humedad ?hum1 0.1)
)	

(deftemplate estacionid
	(slot estacion (type FUZZY-VALUE estacion)))

(deffacts fuzzy-fact
	(ventilador (ventiladorid Shiza)(temperatura 40)(humedad 10)(evaluado no))
	(estacionid (estacion primavera))
	)

(defrule seco_frio_1
	(temperatura frio)
	(humedad seco)
	(estacionid (estacion invierno))
	=>
	
	(assert (velocidad medio))
	)

(defrule seco_frio_2
	(temperatura frio)
	(humedad seco)
	(estacionid (estacion primavera))
	=>
	
	(assert (velocidad bajo))
	)

(defrule seco_frio_3
	(temperatura frio)
	(humedad seco)
	(estacionid (estacion otono))
	=>
	(assert (velocidad medio)))

	
(defrule seco_frio_4
	(temperatura frio)
	(humedad seco)
	(estacionid (estacion verano))
	=>
	(assert (velocidad bajo))
	)

(defrule seco_templado_1
	(temperatura templado)
	(humedad seco)
	(estacionid (estacion verano))
	=>
	
	(assert (velocidad bajo))

	)
(defrule seco_templado_2
	(temperatura templado)
	(humedad seco)
	(estacionid (estacion otono))
	=>
	(assert (velocidad bajo)(evaluado si) ))
	

	
(defrule seco_templado_3
	(temperatura templado)
	(humedad seco)
	(estacionid (estacion primavera))
	=>
	
	(assert (velocidad bajo) ))

	
(defrule seco_templado_4
	(temperatura templado)
	(humedad seco)
	(estacionid (estacion invierno))
	=>

	(assert (velocidad medio) ))

	

(defrule seco_caliente_1
	(temperatura caliente)
	(humedad seco)
	(estacionid (estacion verano))	
	=>
	
	(assert (velocidad medio))
	)

(defrule seco_caliente_2
	
	(temperatura caliente)
	(humedad seco)
	(estacionid (estacion otono))
	=>
	
	(assert (velocidad medio))
	)

(defrule seco_caliente_3
	(temperatura caliente)
	(humedad seco)
	(estacionid (estacion invierno))
	=>
	
	(assert (velocidad alto))
	)

(defrule seco_caliente_4
	(temperatura caliente)
	(humedad seco)
	(estacionid (estacion primavera))
	=>
	
	(assert (velocidad bajo))
	)

(defrule humedo_frio_1
	(temperatura frio)
	(humedad humedo)
	(estacionid (estacion verano))
		=>
	
	(assert (velocidad medio))
	)

(defrule humedo_frio_2
	(temperatura frio)
	(humedad humedo)
	(estacionid (estacion otono))
	=>
	
	(assert (velocidad alto))
	)
(defrule humedo_frio_3
	(temperatura frio)
	(humedad humedo)	
	(estacionid (estacion invierno))
	=>
	
	(assert (velocidad alto))
	)

(defrule humedo_frio_4
	(temperatura frio)
	(humedad humedo)
	(estacionid (estacion primavera))
	=>
	
	(assert (velocidad medio))
	)

(defrule humedo_templado_1
	(temperatura templado)
	(humedad humedo)
	(estacionid (estacion verano))
	=>
	
	(assert (velocidad alto))
	)

(defrule humedo_templado_2
	(temperatura templado)
	(humedad humedo)
	(estacionid (estacion otono))
	=>
	
	(assert (velocidad medio))
	)

(defrule humedo_templado_3
	(temperatura templado)
	(humedad humedo)
	(estacionid (estacion invierno))
	=>
	
	(assert (velocidad medio))
	)
(defrule humedo_templado_4
	(temperatura templado)
	(humedad humedo)
	(estacionid (estacion primavera))
	=>
	
	(assert (velocidad bajo))
	)

(defrule humedo_caliente_1
	(temperatura caliente)
	(humedad humedo)
	(estacionid (estacion verano))
	=>
	
	(assert(velocidad medio) )
	)
(defrule humedo_caliente_2
	(temperatura caliente)
	(humedad humedo)
	(estacionid (estacion otono))
	=>
	
	(assert (velocidad alto))
	)
(defrule humedo_caliente_3
	(temperatura caliente)
	(humedad humedo)
	(estacionid (estacion invierno))
	=>
	
	(assert (velocidad alto))
	)
(defrule humedo_caliente_4
	(temperatura caliente)
	(humedad humedo)
	(estacionid (estacion primavera))
	=>
	(assert (velocidad medio))
	)

(defrule mojado_frio_1
	(temperatura frio)
	(humedad mojado)
	(estacionid (estacion verano))
	=>
	
	(assert(velocidad bajo))
	)
(defrule mojado_frio_2
	(temperatura frio)
	(humedad mojado)
	(estacionid (estacion otono))
	=>
	
	(assert (velocidad medio))
	)

(defrule mojado_frio_3
	(temperatura frio)
	(humedad mojado)
	(estacionid (estacion invierno))
	=>
	
	(assert (velocidad alto))
	)

(defrule mojado_frio_4
	(temperatura frio)
	(humedad mojado)
	(estacionid (estacion primavera))
	=>
	
	(assert (velocidad medio))
	)


(defrule mojado_templado_1
	(temperatura templado)
	(humedad mojado)
	(estacionid (estacion verano))
	=>
	
	(assert (velocidad medio))
	)

(defrule mojado_templado_2
	(temperatura templado)
	(humedad mojado)
	(estacionid (estacion otono))
	=>
	
	(assert (velocidad alto))
	)

(defrule mojado_templado_3
	(temperatura templado)
	(humedad mojado)
	(estacionid (estacion invierno))
	=>
	
	(assert (velocidad alto))
	)

(defrule mojado_templado_4
	(temperatura templado)
	(humedad mojado)
	(estacionid (estacion primavera))
	=>
	
	(assert (velocidad medio))
	)

(defrule mojado_caliente_1
	(temperatura caliente)
	(humedad mojado)
	(estacionid (estacion verano))
	=>
	
	(assert (velocidad medio))
	)

(defrule mojado_caliente_2
	(temperatura caliente)
	(humedad mojado)
	(estacionid (estacion otono))
	=>
	
	(assert (velocidad alto))
	)

(defrule mojado_caliente_3
	(temperatura caliente)
	(humedad mojado)
	(estacionid (estacion invierno))
	=>
	
	(assert(velocidad alto))
	)

(defrule mojado_caliente_4
	(temperatura caliente)
	(humedad mojado)
	(estacionid (estacion primavera))
	=>
	
	(assert(velocidad alto))
	)

(defrule defuzzify
  (declare (salience -1))
 
  ?f <- (ventilador (ventiladorid ?id) (evaluado no))
  ?v <- (velocidad ?vel)
=>
  (bind ?e (maximum-defuzzify ?v))
  (retract ?f)
  (assert  (ventilador (ventiladorid ?id)(velocidad ?e) (evaluado si)))
  (printout t "El ventilador con nombre " ?id " ira a un " ?e " sobre diez de su velocidad " crlf)
)

