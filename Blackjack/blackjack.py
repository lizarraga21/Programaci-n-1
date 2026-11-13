## Nombre del archivo: blackjack.py

## Descripción: Juego de cartas blackjack

## Autor: Ossiel Lizarraga Jimenez, Ricardo Medina Cordova

## Fecha: 11/11/2026

import tkinter as tk

import random

cartas_jugador = []

cartas_dealer = []

palos = ('♥', '♦', '♣', '♠')

denominaciones = ('A','2','3','4','5','6','7','8','9','10','J','Q','K')

def reiniciodebotones() -> None:

    """

    Reinicia los botones del menú al estado normal del principio del juego.



    Returns:

    

        None: No retorna nada ya que solo es la lista de comandos para configurar los botones



    Examples:

    

        >>> reiniciodebotones()

    """

    iniciar.config(state="normal")

    pedir_boton.config(state="disabled")

    plantarse.config(state="disabled")


def carta_oculta(x, y):

    """

    Es el dibujo de las carta oculta del dealer.


    Parameters:


       x (int): Corresponde a las coordenadas donde se quiere dibujar.

       

       y (int): Corresponde a las coordenadas donde se quiere dibujar.


    Raises:

    

        TypeError: Si alguno de los argumentos no es un un entero.


    Examples:

    

        >>> carta_oculta(x, y)

        

        

        >>> carta_oculta("hola", "qwerty")

        Traceback (most recent call last):

        ...

        TypeError: Debe de darse un entero en x o y

        

    """

    if not isinstance(x, int) or not isinstance(y, int):

        raise TypeError("Debe de darse un entero")

    

    canvas_dealer.create_rectangle(x, y, x+80, y+120,fill="blue",width=2)


def actualizar_cartas() -> None:

    """

    Actualiza las cartas en la pantalla.

    


    Returns:

    

        None: Solo actualiza el recuadro de la pantalla con las cartas nuevas

        


    Examples:

    

        >>> actualizar_cartas()

    """

    canvas_dealer.delete("all")

    x = 50

    for carta in cartas_jugador:

        dibujocartas(carta, x, 170)

        x += 100  

    x = 50

    for i in range(len(cartas_dealer)):

        if i == 1 and ocultar_carta==True:

            carta_oculta(x,20)

        else:

            dibujocartas(cartas_dealer[i], x, 20)

        x += 100

        

def dibujocartas(cartas: list, x: int, y: int) -> None:

    """

    Es el dibujo de las cartas que tenga en la mano el jugador o el dealer.


    Parameters:

    

       Cartas (list): Cartas en la mano que se ingrese ya sea del jugador o dealer.


       x (int): Corresponde a las coordenadas donde se quiere dibujar.

       

       y (int): Corresponde a las coordenadas donde se quiere dibujar.


    Raises:

    

        TypeError: Si alguno de los argumentos no es una tupla o un entero.

        ValueError: El valor de alguna de las tuplas no corresponde a una carta.


    Examples:

    

        >>> dibujocartas("hola", x, y)

        Traceback (most recent call last):

        ...

        TypeError: Debe de darse una tupla

        

        >>> dibujocartas(('Y', '9'), x, y)

        Traceback (most recent call last):

        ...

        ValueError: El valor de alguna de las tuplas no corresponde a una carta.

        

        >>> dibujocartas(('4', '♣'), "hola", "hola")

        Traceback (most recent call last):

        ...

        TypeError: Debe de darse un entero en x o y

    """

    if not isinstance(cartas, tuple):

        raise TypeError("Debe de darse una tupla")


    if len(cartas) != 2:

        raise ValueError("La carta debe tener dos elementos")


    valor, palo = cartas

    

    if valor not in denominaciones or palo not in palos:

            raise ValueError("El valor de alguna de las tuplas no corresponde a una carta")

        

    if not isinstance(x, int) or not isinstance(y, int):

        raise TypeError("Debe de darse un número para coordenadas")   


    if palo in ('♥', '♦'):

        color = 'red'

    else:

        color = 'black'

    canvas_dealer.create_rectangle(x, y, x+80, y+120,fill="white",width=2)

    canvas_dealer.create_text(x+15, y+15,text=valor,fill=color)

    canvas_dealer.create_text(x+70, y+105,text=valor,fill=color)

    canvas_dealer.create_text(x+40, y+65,text=palo,fill=color)

    


def plantarse() -> None:

    """

    Termina el juego y si el dealer tiene menos de 17 puntos toma mas cartas, se actualizan las cartas y determina el resultado.

    


    Returns:

    

        None: Solo termina el juego

        


    Examples:

    

        >>> plantarse()

    """

    

    global ocultar_carta

    ocultar_carta=False

    puntos_dealer = calcularpuntos(cartas_dealer)

    while puntos_dealer < 17:

        cartas_dealer.append(baraja.pop())

        puntos_dealer = calcularpuntos(cartas_dealer)

    actualizar_cartas()

    

    if puntos_dealer > 21:

        textopartida.config(text="Ganaste!", bg="blue")

        reiniciodebotones()

    elif puntos_jugador > puntos_dealer:

        textopartida.config(text="Ganaste!", bg="blue")

        reiniciodebotones()

    elif puntos_jugador < puntos_dealer:

        textopartida.config(text="Perdiste!", bg="red")

        reiniciodebotones()

    elif puntos_jugador == puntos_dealer:

        textopartida.config(text="Empate!", bg="yellow")

        reiniciodebotones()


def calcularpuntos(cartas: list) -> int:

    """

    Devuelve cantidad de puntos respecto a las cartas.


    Parameters:

    

       Cartas (list): Cartas en la mano que se ingrese ya sea del jugador o dealer.


    Returns:

    

        int: Corresponde a los puntos que tenga en la mano que se le de


    Raises:

    

        TypeError: Si alguno de los argumentos no es una tupla o una lista.

        ValueError: El valor de alguna de las tuplas no corresponde a una carta.


    Examples:

    

        >>> calcularpuntos([('2', '♦'), ('7', '♣')])

        9

        >>> calcularpuntos([('K', '♦'), ('10', '♠')])

        20

        >>> calcularpuntos(["Hola","Hola","Hola"])

        Traceback (most recent call last):

        ...

        TypeError: Alguno de los elementos en la lista no es una tupla

        

        >>> calcularpuntos([('Z', '6'), ('Y', '9')])

        Traceback (most recent call last):

        ...

        ValueError: El valor de alguna de las tuplas no corresponde a una carta.

    """

    if not isinstance(cartas, list):

        raise TypeError("Debe de darse una lista")

    

    for carta in cartas:

        if not isinstance(carta, tuple):

            raise TypeError("Alguno de los elementos en la lista no es una tupla")

        if len(carta) != 2:

            raise ValueError("La carta debe tener dos elementos")

    

    for carta in cartas:

        valor,palo=carta

        if valor not in denominaciones or palo not in palos:

            raise ValueError("El valor de alguna de las tuplas no corresponde a una carta")

    

    

    puntos = 0

    ases = 0

    for carta in cartas:

        valor = carta[0]

        if valor in ('J', 'Q', 'K'):

            puntos += 10

        elif valor == 'A':

            puntos += 11

            ases += 1

        else:

            puntos += int(valor)

    while puntos > 21 and ases > 0:

        puntos -= 10

        ases -= 1

    return puntos


def pedir() -> None:

    """

    Agrega una carta a la mano del jugador y checa si se pasó de 21 puntos.

    


    Returns:

    

        None: Solo le agrega una carta        


    Examples:

    

        >>> pedir()

    """

    global ocultar_carta, puntos_jugador

    cartas_jugador.append(baraja.pop())

    puntos_jugador = calcularpuntos(cartas_jugador)

    actualizar_cartas()

    if puntos_jugador > 21:

        ocultar_carta=False

        actualizar_cartas()

        reiniciodebotones()

        textopartida.config(text="Perdiste!", bg="red")


def iniciar() -> None:

    """

    Barajea las cartas y se les asigna al jugador y del dealer.

    


    Returns:

    

        None: Solo barajea e inicia el juego

        


    Examples:

    

        >>> iniciar()

    """

    

    global cartas_jugador, cartas_dealer, baraja, puntos_dealer, puntos_jugador, ocultar_carta

    ocultar_carta=True

    puntos_dealer=0

    puntos_jugador=0

    #Barajeo de cartas 

    baraja = []

    for i in denominaciones:

        for j in palos:

            baraja.append((i,j))

    random.shuffle(baraja)


    cartas_jugador=[baraja.pop(), baraja.pop() ]

    cartas_dealer= [baraja.pop(), baraja.pop() ]

    

    # Desactiva el boton en el menú para que no lo presionen dos veces

    iniciar.config(state="disabled")

    pedir_boton.config(state="normal")

    plantarse.config(state="normal")

    

    textopartida.config(text="Tu turno", bg="SystemButtonFace")

    

    puntos_dealer = calcularpuntos(cartas_dealer)

    puntos_jugador = calcularpuntos(cartas_jugador)

    

    if puntos_jugador == 21 and puntos_dealer == 21:

        ocultar_carta=False

        reiniciodebotones()

        textopartida.config(text="Empate!",bg="yellow")

    elif puntos_jugador == 21:

        ocultar_carta=False

        reiniciodebotones()

        textopartida.config(text="Ganaste!", bg="blue")

    elif puntos_dealer == 21:

        ocultar_carta=False

        reiniciodebotones()

        textopartida.config(text="Perdiste!", bg="red")

    actualizar_cartas()


    

# Ventana del juego

# Le puse root a la ventana porque asi venía en la documentación

# El .pack sirve para acomodar ahi ya le deje acomodado mas o menos

root = tk.Tk()

root.title("BlackJack")

root.minsize(640, 480)

root.resizable(width=False, height=False)

root.configure(background="green", highlightbackground="green")

root.state('zoomed')


iniciar=tk.Button(root, text="Iniciar juego", command=iniciar)

iniciar.pack(padx=20, pady=50, side="bottom")


canvas_dealer = tk.Canvas(root, width=600, height=300, background="green")

canvas_dealer.pack(pady=20)


plantarse = tk.Button(root, text="Plantarse", command=plantarse, state="disabled")

plantarse.pack(padx=20, pady=20, side="bottom", anchor="sw")


pedir_boton = tk.Button(root, text="Pedir", command=pedir, state="disabled")

pedir_boton.pack(padx=20, pady=20,side="bottom", anchor="se")


textopartida= tk.Label(root, text="Presiona iniciar juego")

textopartida.pack()

root.mainloop()