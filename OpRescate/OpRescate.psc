// Nombre del archivo: tarea_prog.psc
// Descripción: El usuario ingresa las calificaciones de exámenes y se muestran sus posibilidades de calificaciones.
// Autor: Ossiel Lizárraga Jiménez, Ricardo Medina Córdova
// Fecha: 18/09/2026
Proceso CalificacionProb
	definir estudiantes, sobresalientes, regular, rescatar, inevitable Como Entero
	definir c1,c2,c3, suma, prom, min90, min60 Como Real
	
	Escribir "Bienvenido al programa de evaluación de alumnos donde se analizan sus posibilidades de calificación"
	
	// Este bloque corresponde a las calificaciones que se ingresarán sobre los alumnos y la cantidad de alumnos que se analizarán
	Escribir "Ingrese cantidad de alumnos a analizar: " Sin Saltar
	Leer estudiantes
	Mientras estudiantes <= 0 
		Escribir "Número inválido de estudiantes, ingrese un número mayor a cero:"
		Leer estudiantes
	FinMientras
	sobresalientes<-0
	regular<-0
	rescatar<-0
	inevitable<-0
	
	Mientras estudiantes > 0 Hacer
		Escribir "Ingrese calificación del primer examen [0-100]:"
		Leer c1
		Mientras c1 < 0 o c1 > 100 Hacer
			Escribir "Calificación inválida. Ingrésela de nuevo:"
			Leer c1
		FinMientras
		
		Escribir "Ingrese calificación del segundo examen [0-100]:"
		Leer c2
		Mientras c2 < 0 o c2 > 100 Hacer
			Escribir "Calificación inválida. Ingrésela de nuevo:"
			Leer c2
		FinMientras
		
		Escribir "Ingrese calificación del tercer examen [0-100]:"
		Leer c3
		Mientras c3 < 0 o c3 > 100 Hacer
			Escribir "Calificación inválida. Ingrésela de nuevo:"
			Leer c3
		FinMientras
		
		// Esto es el cálculo del promedio
		suma<-c1+c2+c3
		prom<-redon((suma)/3)
		min90<-360-(suma)
		min60<-240-(suma)
		
		Escribir "El promedio actual es: ", prom
		
		Escribir Sin Saltar "Para obtener un promedio sobresaliente (90): "
		Si min90 > 100 Entonces
			Escribir "Meta no alcanzable"
		Sino
			Si min90 <= 0 Entonces
				Escribir "Meta asegurada (No hacen falta más puntos)"
			Sino
				Escribir "Necesita ", min90, " puntos en el cuarto examen"
			FinSi
		FinSi
		
		Escribir Sin Saltar "Para obtener un promedio regular (61-89): "
		Si min90 <= 100 O min60 < 100 Entonces
			Escribir "Meta alcanzable"
		Sino
			Escribir "Meta no alcanzable"
		FinSi
		
		Escribir Sin Saltar "Para obtener un promedio suficiente (60): "
		Si min60 > 100 Entonces
			Escribir "Meta no alcanzable"
		Sino
			Si min60 <= 0 Entonces
				Escribir "Meta asegurada (No hacen falta más puntos)"
			Sino
				Escribir "Necesita ", min60, " puntos en el cuarto examen"
			FinSi
		FinSi
		
		// Este bloque corresponde a la clasificación de los alumnos
		Escribir Sin Saltar "Categoría asignada: "
		Si min90 <= 100 Entonces
			Escribir "Sobresaliente potencial"
			sobresalientes<-sobresalientes+1
		Sino 
			Si prom >= 60 Entonces
				Escribir "Rendimiento regular potencial"
				regular<-regular+1
			Sino 
				Si min60 <= 100 Entonces
					Escribir "Puede rescatar el semestre"
					rescatar<-rescatar+1
				Sino
					Escribir "Reprobado inevitable"
					inevitable<-inevitable+1
				FinSi
			FinSi
		FinSi
		estudiantes<-estudiantes-1
	FinMientras
	
	// Se escriben las posibilidades y los que reprobarán inevitablemente
	Escribir "Alumnos con posibilidad de promedio sobresaliente: ", sobresalientes
	Escribir "Alumnos con posibilidad de rendimiento regular: ", regular
	Escribir "Alumnos con posibilidad de rescatar el semestre: ", rescatar
	Escribir "Alumnos que van a reprobar inevitablemente: ", inevitable
FinProceso