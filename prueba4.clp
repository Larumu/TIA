(deftemplate serie
    (slot nombre)
    (multislot genero)
    (slot formato (type integer))
    (slot idioma)
    (slot capitulos (type integer))
    (slot peticion)
    (slot situacion);este slot se añade después en la base de hechos, cuidado
    )

(deftemplate serie_res
    (slot caracteristicas_menos)
    (multislot nombres)
    )



(deftemplate usuario_peticion
    (slot nombre);nombre del usuario
    (slot tiempo); si/no
    (slot fragmentada) ;si/no
    (slot compañia);si/no
    (slot animo);feliz/triste
    (slot violencia);si/no
    (slot sangre);si/no
    (slot anime);si/no
    (slot energia);activo/cansado/normal
    (slot mentalidad);creativa/logica
    )

(deftemplate usuario_a_ordenador
    (multislot tiempo)
    (multislot duracion)
    (multislot genero)
    (multislot idioma)
    (slot situacion)
    (slot peticion)
    )

(deffacts catalogo
    (serie (nombre Friends)(genero Comedia)(formato 20)(idioma ingles)(capitulos 100)(peticion entretenimiento))
    (serie (nombre Sobrenatural)(genero Drama Terror Fantasia)(formato 40)(idioma ingles)(capitulos 100)(peticion ambos))
    (serie (nombre The_100)(genero Aventura Drama Ciencia_Ficcion)(formato 40)(idioma ingles)(capitulos 75)(peticion ambos))
    (serie (nombre Doctor_Who)(genero Aventura Ciencia_Ficcion)(formato 40)(idioma ingles)(capitulos 100)(peticion ambos))
    (serie (nombre Sherlock)(genero Aventura Drama Crimen)(formato 90)(idioma ingles)(capitulos 10)(peticion pensar))
    (serie (nombre Yuri_On_Ice)(genero Deportes)(formato 20)(idioma japones)(capitulos 10)(peticion entretenimiento))
    (serie (nombre Evangelion)(genero Accion Ciencia_Ficcion)(formato 20)(idioma japones)(capitulos 25)(peticion ambos))
    (serie (nombre Juego_De_Tronos)(genero Drama Fantasia)(formato 60)(idioma ingles)(capitulos 75)(peticion ambos))
    (serie (nombre Como_Defender_A_Un_Asesino)(genero Drama Suspense Crimen)(formato 40)(idioma ingles)(capitulos 50)(peticion pensar))
    (serie (nombre Rick_y_Morty)(genero Ciencia_Ficcion Comedia Aventura)(formato 20)(idioma ingles)(capitulos 50)(peticion ambos))
    (serie (nombre Narcos)(genero Drama Crimen Suspense)(formato 60)(idioma ingles)(capitulos 50)(peticion ambos))
    (serie (nombre Lucifer)(genero Drama Fantasia Crimen)(formato 40)(idioma ingles)(capitulos 50)(peticion entretenimiento))
    (serie (nombre 13_Reasons_Why)(genero Drama)(formato 60)(idioma ingles)(capitulos 10)(peticion pensar))
    (serie (nombre Outlander)(genero Drama Histórico Ciencia_Ficcion Romance)(formato 40)(idioma ingles)(capitulos 50)(peticion entretenimiento))
    (serie (nombre Teen_Wolf)(genero Drama Fantasia)(formato 40)(idioma ingles)(capitulos 100)(peticion ambos))
    (serie (nombre Jojo's_Bizarre_Adventure)(genero Accion)(formato 20)(idioma japones)(capitulos 100)(peticion entretenimiento))
    (serie (nombre Mozart_In_The_Jungle) (genero Comedia Musical)(formato 40)(idioma ingles)(capitulos 50)(peticion entretenimiento))
    (serie (nombre Black_Mirror)(genero Drama Ciencia_Ficcion Suspense)(formato 60)(idioma ingles)(capitulos 25)(peticion pensar))
    (serie (nombre Orange_is_the_new_black)(genero Comedia)(formato 60)(idioma ingles)(capitulos 75)(peticion entretenimiento))
    (serie (nombre Haikyuu)(genero Deportes Comedia)(formato 20)(idioma japones)(capitulos 50)(peticion entretenimiento))
    (serie (nombre Umineko_No_Naku_Koro_Ni)(genero Crimen Drama)(formato 20)(idioma japones)(capitulos 25)(peticion pensar))
    (serie (nombre Sense8)(genero Drama Fantasia Ciencia_Ficcion)(formato 60)(idioma ingles)(capitulos 25)(peticion ambos))
    (serie (nombre Prison_Break)(genero Drama Suspense)(formato 40)(idioma ingles)(capitulos 75)(peticion ambos))
    (serie (nombre Mirai_Nikki)(genero Drama Suspense Crimen)(formato 20)(idioma japones)(capitulos 25)(peticion ambos))
    (serie (nombre Daredevil)(genero Fantasia Drama Accion)(formato 40)(idioma ingles)(capitulos 25)(peticion entretenimiento))
    (serie (nombre Hannibal)(genero Drama Suspense Crimen)(formato 40)(idioma ingles)(capitulos 50)(peticion pensar))
    (serie (nombre House_of_Cards)(genero Drama Suspense)(formato 60)(idioma ingles)(capitulos 50)(peticion pensar))
    (serie (nombre Glee)(genero Comedia Musical)(formato 40)(idioma ingles)(capitulos 100)(peticion entretenimiento))
    (serie (nombre Galavant)(genero Comedia Fantasia Musical)(formato 20)(idioma ingles)(capitulos 25)(peticion entretenimiento))
    (serie (nombre Boku_no_Hero_Academia)(genero Aventura Accion Comedia Crimen)(formato 20)(idioma japones)(capitulos 25)(peticion entretenimiento))
    (serie (nombre Attack_on_Titan)(genero Accion Aventura Drama Fantasia)(formato 20)(idioma japones)(capitulos 50)(peticion ambos))
    (serie (nombre Miraculous_Ladybug)(genero Accion Fantasia Comedia)(formato 20)(idioma frances)(capitulos 25)(peticion entretenimiento))
    (serie (nombre Como_Conocí_a_Vuestra_Madre)(genero Comedia)(formato 20)(idioma ingles)(capitulos 100)(peticion entretenimiento))
    (serie (nombre Arrow)(genero Drama Fantasia Accion)(formato 40)(idioma ingles)(capitulos 100)(peticion ambos))
    (serie (nombre The_Flash)(genero Drama Fantasia Accion)(formato 40)(idioma ingles)(peticion ambos))
    (serie (nombre Stranger_Things)(genero Drama Fantasia Suspense)(formato 60)(idioma ingles)(peticion ambos))
    (serie (nombre El_Ministerio_del_Tiempo)(formato 60)(idioma español)(capitulos 25)(peticion ambos))
    )

(deffacts pregunta-respuesta
    (usuario_a_ordenador )
	(usuario_peticion (nombre Laura)(tiempo si)(fragmentada no)(animo triste)(violencia si)
        (sangre no)(mentalidad logica))
)

(deffacts aux
    (serie_res (caracteristicas_menos 0))
    (serie_res (caracteristicas_menos 1))
    (serie_res (caracteristicas_menos 2))
    
    )


(deffunction select-genero(?l_se ?pet)
    (bind ?pos 1)
    (bind ?res 0)
    (bind ?cont (length$ ?l_se.genero))
    (bind ?lista_len_tot (length$ ?l_se.genero))
    (while (> ?cont 0)
        (bind ?cont (- ?cont 1))
        (bind ?ejemplo (nth$ ?pos ?l_se.genero))
        (if (member$ ?ejemplo ?pet.genero)
            then (bind ?res (+ 1 ?res))
            )
        (bind ?pos (+ 1 ?pos))
        )
    (if (eq ?res ?lista_len_tot)
    	then (return 1))
	(if (not(eq ?res ?lista_len_tot))
    	then (return 0))
    )

;Determina el número de capitulos y duración de los mismos adecuado
(defrule fragmentada_tiempo
    ?up<-(usuario_peticion (tiempo ?tiempo)(fragmentada ?frag))
    ?uo <- (usuario_a_ordenador (tiempo $?t))
    (test (eq 0 (length$ $?t)))
    (test (= ?tiempo no))
    (test (= ?frag no))
	=>
    (modify ?uo (tiempo 25 10)(duracion 20 40))) 

(defrule fragmentada_tiempo_1
    ?up<-(usuario_peticion (tiempo ?tiempo)(fragmentada ?frag))
    ?uo <- (usuario_a_ordenador (tiempo $?t))
    (test (eq 0 (length$ $?t)))
    (test (= ?tiempo no))
    (test (= ?frag si))
	=>
    (modify ?uo (tiempo 25 10)(duracion 20 40 60 90))) 

(defrule fragmentada_tiempo_2
    (declare (no-loop TRUE))
    ?up<-(usuario_peticion (tiempo ?tiempo)(fragmentada ?frag))
    ?uo <- (usuario_a_ordenador (tiempo $?t))
    (test (eq 0 (length$ $?t)))
    (test (= ?tiempo si))
    (test (= ?frag si))
	=>
    (modify ?uo (tiempo 100 75 50)(duracion 40 60 90))) 

(defrule fragmentada_tiempo_3
    (declare (no-loop TRUE))
    ?up <- (usuario_peticion (tiempo ?tiempo)(fragmentada ?frag))
    ?uo <- (usuario_a_ordenador (tiempo $?t))
    (test (eq 0 (length$ $?t)))
    (test (eq ?tiempo si))
    (test (eq ?frag no))
	=>
    (printout t "Holaaaa"crlf)
    (modify ?uo (tiempo 100 75 50)(duracion 20 40 60 90))) 

;En el caso de que tenga tiempo y no quiera fragmentar las series y quiera compañía
(defrule soledad_o_no
    (declare (no-loop TRUE))
    ?up<-(usuario_peticion (compañia ?comp))
    ?uo <- (usuario_a_ordenador (tiempo $?tiempo) (duracion $?dur)(genero $?g)(idioma $?i)(situacion ?s)(peticion ?p))
    (test (eq ?comp si))
    (test (eq 3 (length$ $?tiempo)))
    (test (eq 4 (length$ $?dur)))
    =>
    (modify ?uo (tiempo 15 20))
   ; (retract ?uo)
   ; (modify ?up (compañia done) )
    ;(assert (usuario_a_ordenador (tiempo 15 20) (duracion $?dur)(genero $?g)(idioma $?i)(situacion ?s)(peticion ?p)))
    (printout t "Hola c:"crlf)
    )

;En el caso de que tenga tiempo y quiera fragmentar
(defrule soledad_o_no_1
	(declare (no-loop TRUE))
    (usuario_peticion (compañia ?comp))
    ?uo <- (usuario_a_ordenador (tiempo $?tiempo) (duracion $?dur))
    (test (eq ?comp si))
    (test (eq 3 (length$ $?tiempo)))
    (test (eq 3 (length$ $?dur)))
    =>
    (modify ?uo (tiempo 25 10)(duracion 20 $?dur )))

;En el resto de casos nos da igual lo que diga, no se añadirá nada

;Determina la tolerancia del usuario al idioma japonés
(defrule anime_1
    (usuario_peticion (anime ?ani))
    ?uo <- (usuario_a_ordenador (idioma $?i))
    (test (eq ?ani si))
    =>
    (modify ?uo (idioma japones)))

(defrule anime_2
    (usuario_peticion (anime ?ani))
    ?uo <- (usuario_a_ordenador (idioma $?i))
    (test (eq ?ani no))
    =>
    (modify ?uo (idioma ingles español frances)))

(defrule energia
    (usuario_peticion (energia ?e))
    ?uo <- (usuario_a_ordenador (peticion ?p))
    (test (eq ?e cansado))
    =>
    (modify ?uo (peticion entretenimiento)))

(defrule energia_2
    (usuario_peticion (energia ?e))
    ?uo <- (usuario_a_ordenador (peticion ?p))
    (test (eq ?e activo))
    =>
    (modify ?uo (peticion pensar)))

(defrule energia_3
    (usuario_peticion (energia ?e))
    ?uo <- (usuario_a_ordenador (peticion ?p))
    (test (eq ?e normal))
    =>
    (modify ?uo (peticion ambos)))

(defrule mentalidad
    (usuario_peticion (mentalidad ?m))
    ?uo <- (usuario_a_ordenador (situacion ?s))
    (test (eq ?m creativa))
    =>
    (modify ?uo (situacion irreal)))

(defrule mentalidad_2
    (usuario_peticion (mentalidad ?m))
    ?uo <- (usuario_a_ordenador (situacion ?s))
    (test (eq ?m logica))
    =>
    (modify ?uo (situacion real)))

;Si una serie se situa en un mundo real o irreal y que lo puede determinar. UPDATE: Ya funciona, yassss!~
(defrule situacion_1
    ?s <-(serie (genero $?g)(situacion ?r))
    (test (or (member$ Ciencia_Ficcion $?g)(member$ Fantasia $?g)));CAMBIADO AYER, CUIDADO
    =>
    (modify ?s (situacion irreal)))
	
(defrule situacion_2
    ?s <-(serie (genero $?g)(situacion ?r))
    (test (and (not(member$ Ciencia_Ficcion $?g))(not(member$ Fantasia $?g))));CAMBIADO AYER, CUIDADO
    =>
    (modify ?s (situacion real)))

;Diferentes situaciones con tres factores (animo, violencia y sangre) que nos ayudan a diferenciar entre 7 listas de generos diferentes
(defrule Caso_1
    (usuario_peticion (animo ?a)(violencia ?v)(sangre ?s))
    ?uo <- (usuario_a_ordenador (genero $?g))
    (test (eq ?v si))
    (test (eq ?s si))
    (test (eq ?a feliz))
    =>
    (modify ?uo (genero Comedia Drama Musical Terror Fantasia Aventura Ciencia_Ficcion Crimen Deportes Accion Suspense Historico Romance))
    )

(defrule Caso_2
    (usuario_peticion (animo ?a)(violencia ?v)(sangre ?s))
    ?uo <- (usuario_a_ordenador (genero $?g))
    (test (eq ?v si))
    (test (eq ?s si))
    (test (eq ?a triste))
    
    =>
    (modify ?uo (genero Comedia Musical Terror Fantasia Aventura Ciencia_Ficcion Crimen Deportes Accion Suspense Historico Romance))
    )

(defrule Caso_3
    (usuario_peticion (animo ?a)(violencia ?v)(sangre ?s))
    ?uo <- (usuario_a_ordenador (genero $?g))
    (test (eq ?v si))
    (test (eq ?s no))
    (test (eq ?a feliz))
    
    =>
    (modify ?uo (genero Comedia Drama Musical Fantasia Aventura Ciencia_Ficcion Deportes Accion Historico))
    )

(defrule Caso_4
    (usuario_peticion (animo ?a)(violencia ?v)(sangre ?s))
    ?uo <- (usuario_a_ordenador (genero $?g))
    (test (eq ?v si))
    (test (eq ?s no))
    (test (eq ?a triste))
    
    =>
    (modify ?uo (genero Comedia Musical Fantasia Aventura Ciencia_Ficcion Deportes Accion Historico Romance))
    )

(defrule Caso_5
    (usuario_peticion (animo ?a)(violencia ?v)(sangre ?s))
    ?uo <- (usuario_a_ordenador (genero $?g))
    (test (eq ?v no))
    (test (eq ?s si))
    (test (eq ?a feliz))
    
    =>
    (modify ?uo (genero Comedia Musical Drama Fantasia Aventura Deportes Historico))
    )

(defrule Caso_6_8
    (usuario_peticion (animo ?a)(violencia ?v)(sangre ?s))
    ?uo <- (usuario_a_ordenador (genero $?g))
    (test (eq ?v no))
    (test (eq ?s (or si no)))
    (test (eq ?a triste))
    
    =>
    (modify ?uo (genero Comedia Musical Fantasia Aventura Deportes Historico Romance))
    )

(defrule Caso_7
    (usuario_peticion (animo ?a)(violencia ?v)(sangre ?s))
    ?uo <- (usuario_a_ordenador (genero $?g))
    (test (eq ?v no))
    (test (eq ?s no))
    (test (eq ?a feliz))
 
    =>
    (modify ?uo (genero Comedia Drama Fantasia Musical Aventura Deportes Historico))
    )

(defrule depuracion
    (declare (salience 100))
    ?f <- (usuario_a_ordenador (tiempo $?t)(duracion $?d)(genero $?g)(idioma $?i)(peticion ?p)(situacion ?s))

    =>
    (printout t "Este es el tiempo: " $?t crlf)
    (printout t "Esta es la duracion: " $?d crlf)
    (printout t "Este es el idioma: " $?i crlf)
    (printout t "Esta es la peticion: " ?p crlf)
    (printout t "Esta es la situacion: " ?s crlf)
   (printout t "Estos son los generos: " $?g crlf)
    )

;BACKWARD ZONE

;SLOT ANIME A IDIOMA
(do-backward-chaining usuario_peticion)

(defrule pregunta_anime
    (declare (salience -1))
    (exists (need-usuario_peticion (nombre ?n)))
    ?u <- (usuario_peticion (nombre ?n)(anime nil))
    =>
    (printout t ?n ", ¿estarías dispuesta a ver una serie de anime? (responde con si o no): ")
    (modify ?u (anime(read)))
    )


;SLOT MENTALIDAD

(defrule pregunta_mentalidad
    (declare (salience -1))
    (exists (need-usuario_peticion (nombre ?n)))
    ?u <- (usuario_peticion (nombre ?n)(mentalidad nil))
    =>
    (printout t ?n ", ¿como definirías tu tipo de pensamiento, logica o creativa?: ")
    (modify ?u (mentalidad(read)))
    )


;SLOT ENERGIA-PETICIÓN

(defrule pregunta_peticion
    (declare (salience -1))
    (exists (need-usuario_peticion (nombre ?n)))
    ?u <- (usuario_peticion (nombre ?n)(energia nil))
    =>
    (printout t ?n ", nos preocupamos por ti, ¿como te encuentras ahora mismo?(responde entre activo/cansado/normal): ")
    (modify ?u (energia(read)))
    )


;SLOT COMPAÑIA
(defrule pregunta_compañia
    (declare (salience -1))
    (exists (need-usuario_peticion (nombre ?n)))
    ?u <- (usuario_peticion (nombre ?n)(compañia nil))
    ?uo <- (usuario_a_ordenador (duracion $?d)(tiempo $?t))
    =>
    (printout t ?n ", ¿prefieres ver las series en compañia? (responde con si/no): ")
    (modify ?u (compañia(read)))
    )

(defrule respuesta_compañia_si_1
    (declare (no-loop TRUE)(salience 10))
    ?u <- (usuario_peticion (nombre ?n)(compañia si))
    ?uo <- (usuario_a_ordenador (duracion $?d)(tiempo $?t))
    (test (eq 3 (length$ $?d)))
    (test (eq 3 (length$ $?t)))
    =>
    (modify ?uo (tiempo 25 10)(duracion 20 $?d ))
    )

(defrule respuesta_compañia_si_2
    (declare (no-loop TRUE)(salience 10))
    ?u <- (usuario_peticion (nombre ?n)(compañia si))
    ?uo <- (usuario_a_ordenador (duracion $?d)(tiempo $?t))
    (test (eq 4 (length$ $?d)))
    (test (eq 3 (length$ $?t)))
     =>
    (modify ?uo (tiempo 25 10))
    )
   
;Tiempo = número de capitulos
;Duracion = duración de cada uno de los capítulos
(defrule seleccion
    (declare (salience -2))
    ?sr <- (serie_res (caracteristicas_menos 0)(nombres $?ns))
    ?uo <- (usuario_a_ordenador (tiempo $?t)(duracion $?d)(genero $?g)(idioma $?i)(peticion ?p)(situacion ?s1))
    ?serie <- (serie (nombre ?n)(genero $?g1)(formato ?f)(idioma ?i1)(capitulos ?c)(peticion ?p1)(situacion ?s2))
    (test (eq 1 (select-genero ?serie ?uo)))
    (test (member$ ?f $?d));Formato de capítulo
    (test (member$ ?c $?t))
    (test (member$ ?i1 $?i))
    (test (eq ?s1 ?s2))
    (test (eq ?p ?p1))
    (test (not (member$ ?n $?ns)))
    =>
    (printout t "La serie elegida es: " ?n crlf)
    (modify ?sr (nombres $?ns ?n))
    )

(defrule seleccion_2
    (declare (salience -4))
    ?sr1 <- (serie_res (caracteristicas_menos 2)(nombres $?ns1))
    ?sr2 <- (serie_res (caracteristicas_menos 0)(nombres $?ns2))
    (test (eq 0 (length$ $?ns2)))
    ?uo <- (usuario_a_ordenador (tiempo $?t)(duracion $?d)(genero $?g)(idioma $?i)(peticion ?p)(situacion ?s1))
    ?serie <- (serie (nombre ?n)(genero $?g1)(formato ?f)(idioma ?i1)(capitulos ?c)(peticion ?p1)(situacion ?s2))
    (test (eq 1 (select-genero ?serie ?uo)))
    (test (not (member$ ?n $?ns1)))
    (test (not (member$ ?n $?ns2)))
    (test (member$ ?f $?d));Formato de capítulo
    (test (member$ ?c $?t))
    (test (eq ?p ?p1))
   
    =>
    (printout t "En un mundo " ?s2 " con idioma " ?i1", a lo mejor te gusta " ?n crlf)
    (modify ?sr1 (nombres $?ns1 ?n))
    )

(defrule seleccion_nada
    (declare (salience -5)(no-loop TRUE))
    ?sr1 <- (serie_res (caracteristicas_menos 0)(nombres $?ns1))
    ?sr <- (serie_res (caracteristicas_menos 2)(nombres $?ns))
    (test (eq 0 (length$ $?ns)))
    (test (eq 0 (length$ $?ns1)))
    =>
    (printout t "Lo siento, no hemos encontrado ninguna serie que cumpla lo suficiente con tus requisitos."crlf)
    )

(reset)
(facts)
(run)