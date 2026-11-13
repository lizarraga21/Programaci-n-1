// Nombre del archivo: CURPClave.psc
//Descripción: El usuario ingresa sus datos personales y se le proporcionan los primeros 16 carácteres de su CURP"
//Autor: Ossiel Lizarraga Jimenez, Ricardo Medina Cordova
//Fecha: 11/10/2026


//Funcion que une todas las partes
Funcion curp <- generadorcurp ( nom1, ape1, ape2, genero, entidad, dia, mes ,anio)
	definir curp, p4 como cadena
	p4<-primcuatro ( nom1,ape1,ape2)
	
	Si p4="BACA" o p4="BAKA" o p4="BUEI" o p4="BUEY" o p4="CACA" o p4="CACO" o p4="CAGA" o p4="CAGO" o p4="CAKA" o p4="CAKO" o p4="COGE" o p4="COGI" o p4="COJA" o p4="COJE" o p4="COJI" o p4="COJO" o p4="COLA" o p4="CULO" o p4="FALO" o p4="FETO" o p4="GETA" o p4="GUEI" o p4="GUEY" o p4="JETA" o p4="JOTO" o p4="KACA" o p4="KACO" o p4="KAGA" o p4="KAGO" o p4="KAKA" o p4="KAKO" o p4="KOGE" o p4="KOGI" o p4="KOJA" o p4="KOJE" o p4="KOJI" o p4="KOJO" o p4="KOLA" o p4="KULO" o p4="LILO" o p4="LOCA" o p4="LOCO" o p4="LOKA" o p4="LOKO" o p4="MAME" o p4="MAMO" o p4="MEAR" o p4="MEAS" o p4="MEON" o p4="MIAR" o p4="MION" o p4="MOCO" o p4="MOKO" o p4="MULA" o p4="MULO" o p4="NACA" o p4="NACO" o p4="PEDA" o p4="PEDO" o p4="PENE" o p4="PIPI" o p4="PITO" o p4="POPO" o p4="PUTA" o p4="PUTO" o p4="QULO" o p4="RATA" o p4="ROBA" o p4="ROBE" o p4="ROBO" o p4="RUIN" o p4="SENO" o p4="TETA" o p4="VACA" o p4="VAGA" o p4="VAGO" o p4="VAKA" o p4="VUEI" o p4="VUEY" o p4="WUEI" o p4="WUEY" Entonces
		p4 <- Concatenar(SubCadena(p4,1,1), Concatenar("X", SubCadena(p4,3,4)))
	FinSi
	
	curp <- p4
	curp<-Concatenar(curp, cinc_10 (anio, mes, dia))
	si genero = 1
		curp<-Concatenar(curp, "H")
	SiNo
		curp<-Concatenar(curp, "M")
	FinSi
	curp<-Concatenar(curp, estado ( entidad ))
	curp<-Concatenar(curp, ultimoscaracteres (ape1,ape2,nom1))
Fin Funcion

//Extrae consonantes internas de los apellidos y nombres P14-16
Funcion pfinal <- ultimoscaracteres (ape1, ape2, nom1 )
	definir pfinal, consonante, nom_procesado como cadena
	definir primerconsonante Como Logico
	definir i Como Entero
	definir cambioNom Como Logico
	pfinal <- ""
	
	ape1<-Mayusculas(ape1)
	i<-2
	primerconsonante<-falso
	mientras i <= Longitud(ape1) y primerconsonante = falso
		consonante<-SubCadena(ape1,i,i)
		si consonante='A' o consonante='E' o consonante='O' o consonante='I' o consonante='U' o consonante='Á' o consonante='É' o consonante='Í' o consonante='Ó' o consonante='Ú' o consonante='Ü' o consonante=' '
			i<-i+1
		SiNo
			si consonante = 'Ñ' Entonces
				consonante <- 'X'
			FinSi
			pfinal<-Concatenar(pfinal, consonante)
			primerconsonante<-verdadero
		FinSi
	FinMientras
	si primerconsonante = falso Entonces
		pfinal<-Concatenar(pfinal, "X")
	FinSi
	
	ape2<-Mayusculas(ape2)
	si Longitud(ape2) = 0 o ape2 = " " Entonces
		pfinal<-Concatenar(pfinal, "X")
	sino
		i<-2
		primerconsonante<-falso
		mientras i <= Longitud(ape2) y primerconsonante = falso
			consonante<-SubCadena(ape2,i,i)
			si consonante='A' o consonante='E' o consonante='O' o consonante='I' o consonante='U' o consonante='Á' o consonante='É' o consonante='Í' o consonante='Ó' o consonante='Ú' o consonante='Ü' o consonante=' '
				i<-i+1
			SiNo
				si consonante = 'Ñ' Entonces
					consonante <- 'X'
				FinSi
				pfinal<-Concatenar(pfinal, consonante)
				primerconsonante<-verdadero
			FinSi
		FinMientras
		si primerconsonante = falso Entonces
			pfinal<-Concatenar(pfinal, "X")
		FinSi
	finsi
	
	nom1<-Mayusculas(nom1)
	nom_procesado<-nom1
	Repetir
		cambioNom <- Falso
		si (SubCadena(nom_procesado,1,6) = 'MARIA ' o SubCadena(nom_procesado,1,5) = 'JOSE ' o SubCadena(nom_procesado,1,3) = 'MA ' o SubCadena(nom_procesado,1,4) = 'MA. ' o SubCadena(nom_procesado,1,3) = 'DE ' o SubCadena(nom_procesado,1,4) = 'DEL ' o SubCadena(nom_procesado,1,4) = 'LOS ' o SubCadena(nom_procesado,1,4) = 'LAS ' o SubCadena(nom_procesado,1,3) = 'LA ' o SubCadena(nom_procesado,1,3) = 'EL ' o SubCadena(nom_procesado,1,3) = 'DA ' o SubCadena(nom_procesado,1,4) = 'DAS ' o SubCadena(nom_procesado,1,4) = 'DER ' o SubCadena(nom_procesado,1,3) = 'DI ' o SubCadena(nom_procesado,1,4) = 'DIE ' o SubCadena(nom_procesado,1,3) = 'DD ' o SubCadena(nom_procesado,1,3) = 'LE ' o SubCadena(nom_procesado,1,4) = 'LES ' o SubCadena(nom_procesado,1,4) = 'MAC ' o SubCadena(nom_procesado,1,3) = 'MC ' o SubCadena(nom_procesado,1,4) = 'VAN ' o SubCadena(nom_procesado,1,4) = 'VON ' o SubCadena(nom_procesado,1,2) = 'J ' o SubCadena(nom_procesado,1,3) = 'J. ' o SubCadena(nom_procesado,1,2) = 'Y ') Y Longitud(nom_procesado) > 2 Entonces
			i<-1
			mientras SubCadena(nom_procesado,i,i) <> ' ' y i <= Longitud(nom_procesado) hacer
				i<-i+1
			finmientras
			si i < Longitud(nom_procesado) Entonces
				nom_procesado<-SubCadena(nom_procesado,i+1,Longitud(nom_procesado))
				cambioNom <- Verdadero
			FinSi
		finsi
	Hasta Que cambioNom = Falso
	
	i<-2
	primerconsonante<-falso
	mientras i <= Longitud(nom_procesado) y primerconsonante = falso
		consonante<-SubCadena(nom_procesado,i,i)
		si consonante='A' o consonante='E' o consonante='O' o consonante='I' o consonante='U' o consonante='Á' o consonante='É' o consonante='Í' o consonante='Ó' o consonante='Ú' o consonante='Ü' o consonante=' '
			i<-i+1
		SiNo
			si consonante = 'Ñ' Entonces
				consonante <- 'X'
			FinSi
			pfinal<-Concatenar(pfinal, consonante)
			primerconsonante<-verdadero
		FinSi
	FinMientras
	si primerconsonante = falso Entonces
		pfinal<-Concatenar(pfinal, "X")
	FinSi
	
Fin Funcion

//Asigna clave del Estado
Funcion p12_13 <- estado ( entidad )
	Definir p12_13 como cadena
	segun entidad Hacer
		1:
			p12_13<-'AS'
		2:
			p12_13<-'BC'
		3:
			p12_13<-'BS'
		4:
			p12_13<-'CC'
		5:
			p12_13<-'CL'
		6:
			p12_13<-'CM'
		7:
			p12_13<-'CS'
		8:
			p12_13<-'CH'
		9:
			p12_13<-'DF'
		10:
			p12_13<-'DG'
		11:
			p12_13<-'GT'
		12:
			p12_13<-'GR'
		13:
			p12_13<-'HG'
		14:
			p12_13<-'JC'
		15:
			p12_13<-'MC'
		16:
			p12_13<-'MN'
		17:
			p12_13<-'MS'
		18:
			p12_13<-'NT'
		19:
			p12_13<-'NL'
		20:
			p12_13<-'OC'
		21:
			p12_13<-'PL'
		22:
			p12_13<-'QT'
		23:
			p12_13<-'QR'
		24:
			p12_13<-'SP'
		25:
			p12_13<-'SL'
		26:
			p12_13<-'SR'
		27:
			p12_13<-'TC'
		28:
			p12_13<-'TS'
		29:
			p12_13<-'TL'
		30:
			p12_13<-'VZ'
		31:
			p12_13<-'YN'
		32:
			p12_13<-'ZS'
		De Otro Modo:
			p12_13<-'NE'
	Fin Segun
Fin Funcion

//Hace la fecha de nacimiento en 6 digitos
Funcion p5_10 <- cinc_10 (anio, mes, dia)
	definir aniot, mest, diat, p5_10 como cadena
	aniot<-ConvertirATexto(anio)
	mest<-ConvertirATexto(mes)
	diat<-ConvertirATexto(dia)
	p5_10<-SubCadena(aniot,3,4)
	
	si mes < 10
		p5_10<-Concatenar(p5_10,"0")
		p5_10<-Concatenar(p5_10,mest)
	SiNo
		p5_10<-Concatenar(p5_10,mest)
	FinSi
	
	si dia<10
		p5_10<-Concatenar(p5_10,"0")
		p5_10<-Concatenar(p5_10,diat)
	SiNo
		p5_10<-Concatenar(p5_10,diat)
	FinSi
Fin Funcion

//Consigue las primeras 4 letras de la CURP base el nombre
Funcion p1_4 <- primcuatro ( nom1,ape1,ape2)
	definir p2, nom_procesado, p1_4, init_ape1, init_ape2, init_nom, ape1_proc como cadena
	definir i Como Entero
	definir primervocal Como Logico
	definir cambioApe Como Logico
	definir cambioNom Como Logico
	nom1<-Mayusculas(nom1)
	ape1<-Mayusculas(ape1)
	ape2<-Mayusculas(ape2)
	
	ape1_proc <- ape1
	Repetir
		cambioApe <- Falso
		si SubCadena(ape1_proc,1,3) = "DA " o SubCadena(ape1_proc,1,4) = "DAS " o SubCadena(ape1_proc,1,3) = "DE " o SubCadena(ape1_proc,1,4) = "DEL " o SubCadena(ape1_proc,1,4) = "DER " o SubCadena(ape1_proc,1,3) = "DI " o SubCadena(ape1_proc,1,4) = "DIE " o SubCadena(ape1_proc,1,3) = "DD " o SubCadena(ape1_proc,1,3) = "EL " o SubCadena(ape1_proc,1,3) = "LA " o SubCadena(ape1_proc,1,4) = "LOS " o SubCadena(ape1_proc,1,4) = "LAS " o SubCadena(ape1_proc,1,3) = "LE " o SubCadena(ape1_proc,1,4) = "LES " o SubCadena(ape1_proc,1,4) = "MAC " o SubCadena(ape1_proc,1,3) = "MC " o SubCadena(ape1_proc,1,4) = "VAN " o SubCadena(ape1_proc,1,4) = "VON " o SubCadena(ape1_proc,1,2) = "Y " Entonces
			i <- 1
			Mientras SubCadena(ape1_proc,i,i) <> " " y i <= Longitud(ape1_proc) Hacer
				i <- i + 1
			FinMientras
			si i < Longitud(ape1_proc) Entonces
				ape1_proc <- SubCadena(ape1_proc, i+1, Longitud(ape1_proc))
				cambioApe <- Verdadero
			FinSi
		FinSi
	Hasta Que cambioApe = Falso
	
	//Nombres compuestos
	nom_procesado<-nom1
	Repetir
		cambioNom <- Falso
		si (SubCadena(nom_procesado,1,6) = 'MARIA ' o SubCadena(nom_procesado,1,5) = 'JOSE ' o SubCadena(nom_procesado,1,3) = 'MA ' o SubCadena(nom_procesado,1,4) = 'MA. ' o SubCadena(nom_procesado,1,2) = 'J ' o SubCadena(nom_procesado,1,3) = 'J. ') Y Longitud(nom_procesado) > 2 Entonces
			i<-1
			repetir 
				i<-i+1
			hasta que SubCadena(nom_procesado,i,i)=' ' o i > Longitud(nom_procesado)
			si i < Longitud(nom_procesado) Entonces
				nom_procesado<-SubCadena(nom_procesado,i+1,Longitud(nom_procesado))
				cambioNom <- Verdadero
			FinSi
		finsi
	Hasta Que cambioNom = Falso
	
	//Primera vocal interna del apellido paterno procesado
	i<-2
	primervocal<-falso
	p2<-'X'
	mientras i <= Longitud(ape1_proc) y primervocal = falso
		p2<-SubCadena(ape1_proc,i,i)
		si p2= 'A' o p2='E' o p2='O' o p2='I' o p2='U' o p2='Á' o p2='É' o p2='Í' o p2='Ó' o p2='Ú' o p2='Ü'
			primervocal<-Verdadero
		SiNo
			i<-i+1
		FinSi
	FinMientras
	si primervocal = falso Entonces
		p2 <- 'X'
	FinSi
	
	init_ape1 <- SubCadena(ape1_proc,1,1)
	si init_ape1 = 'Ñ' o init_ape1 = '/' o init_ape1 = '-' o init_ape1 = '.' Entonces
		init_ape1 <- 'X'
	FinSi
	
	si p2 = '/' o p2 = '-' o p2 = '.' Entonces
		p2 <- 'X'
	FinSi
	
	si Longitud(ape2) = 0 o ape2 = " " Entonces
		init_ape2 <- 'X'
	sino
		init_ape2 <- SubCadena(ape2,1,1)
		si init_ape2 = 'Ñ' o init_ape2 = '/' o init_ape2 = '-' o init_ape2 = '.' Entonces
			init_ape2 <- 'X'
		FinSi
	FinSi
	
	init_nom <- SubCadena(nom_procesado,1,1)
	si init_nom = 'Ñ' o init_nom = '/' o init_nom = '-' o init_nom = '.' Entonces
		init_nom <- 'X'
	FinSi
	
	p1_4 <- Concatenar(init_ape1, p2)
	p1_4 <- Concatenar(p1_4, init_ape2)
	p1_4 <- Concatenar(p1_4, init_nom)
Fin Funcion

Proceso CURPClave
	definir anio,mes,dia, entidad, genero como entero 
	definir nom1,ape1,ape2, curp como cadena
	definir esBisiesto Como Logico
	
	Escribir "Ingrese sus nombres: "
	leer nom1
	Mientras Longitud(nom1)=0
		Leer nom1
	FinMientras
	Escribir "Ingrese su primer apellido: "
	leer ape1
	Mientras Longitud(ape1)=0
		Leer ape1
	FinMientras
	Escribir "Ingrese su segundo apellido (si no tiene, presione Enter): "
	leer ape2
	Escribir "Ingrese año de nacimiento en el formato XXXX: "
	leer anio
	mientras anio<1898 o anio>2026
		Escribir "Ingrese año de nacimiento en el formato XXXX: "
		leer anio
	FinMientras
	
	Escribir "Ingrese número de mes: "
	Escribir "1. Enero"
	Escribir "2. Febrero"
	Escribir "3. Marzo"
	Escribir "4. Abril"
	Escribir "5. Mayo"
	Escribir "6. Junio"
	Escribir "7. Julio"
	Escribir "8. Agosto"
	Escribir "9. Septiembre"
	Escribir "10. Octubre"
	Escribir "11. Noviembre"
	Escribir "12. Diciembre"
	leer mes
	mientras mes<1 o mes>12
		Escribir "Ingrese un número de mes válido: "
		leer mes
	FinMientras
	
	Escribir "Ingrese día de nacimiento: "
	leer dia
	
	//Filtros de dias validos
	Si mes = 1 o mes = 3 o mes = 5 o mes = 7 o mes = 8 o mes = 10 o mes = 12 Entonces
		Mientras dia<1 o dia>31 Hacer
			Escribir "Ingrese día válido: "
			leer dia
		FinMientras
	SiNo si mes = 4 o mes = 6 o mes = 9 o mes = 11 Entonces
			Mientras dia<1 o dia>30 Hacer
				Escribir "Ingrese día válido: "
				leer dia
			FinMientras
		SiNo
			esBisiesto <- (anio MOD 4 = 0 Y anio MOD 100 <> 0) O (anio MOD 400 = 0)
			Si esBisiesto Entonces
				Mientras dia<1 o dia>29 Hacer
					Escribir "Ingrese día válido: "
					leer dia
				FinMientras
			SiNo
				Mientras dia<1 o dia>28 Hacer
					Escribir "Ingrese día válido: "
					leer dia
				FinMientras
			FinSi
		FinSi
	FinSi
	
	Escribir "Ingrese número 1 si su género es hombre o número 2 si su género es mujer:"
	leer genero
	mientras genero < 1 o genero > 2
		Escribir "Ingrese un número válido de su género: "
		leer genero
	Finmientras
	
	Escribir "Ingrese número correspondiente a su estado: "
	Escribir "1. Aguascalientes"
	Escribir "2. Baja California"
	Escribir "3. Baja California Sur"
	Escribir "4. Campeche"
	Escribir "5. Coahuila"
	Escribir "6. Colima"
	Escribir "7. Chiapas"
	Escribir "8. Chihuahua"
	Escribir "9. Distrito Federal"
	Escribir "10. Durango"
	Escribir "11. Guanajuato"
	Escribir "12. Guerrero"
	Escribir "13. Hidalgo"
	Escribir "14. Jalisco"
	Escribir "15. Estado de México"
	Escribir "16. Michoacán"
	Escribir "17. Morelos"
	Escribir "18. Nayarit"
	Escribir "19. Nuevo León"
	Escribir "20. Oaxaca"
	Escribir "21. Puebla"
	Escribir "22. Querétaro"
	Escribir "23. Quintana Roo"
	Escribir "24. San Luis Potosí"
	Escribir "25. Sinaloa"
	Escribir "26. Sonora"
	Escribir "27. Tabasco"
	Escribir "28. Tamaulipas"
	Escribir "29. Tlaxcala"
	Escribir "30. Veracruz"
	Escribir "31. Yucatán"
	Escribir "32. Zacatecas"
	Escribir "33. Nacido fuera de territorio nacional"
	leer entidad
	mientras entidad < 1 o entidad > 33
		Escribir "Ingrese un número válido correspondiente a su estado: "
		leer entidad
	finmientras
	
	curp<-generadorcurp(nom1, ape1, ape2, genero, entidad, dia, mes ,anio)
	Escribir "Su CURP es: " ,curp
FinProceso