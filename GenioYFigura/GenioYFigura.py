## Nombre del archivo: GenioYFigura.py
## Descripción: El usuario ingresa una dimensión, el símbolo a utilizar y la figura a imprimir.
## Autor: Ossiel Lizarraga Jimenez, Ricardo Medina Cordova
## Fecha: 4/11/2026
def reloj(n, simbolo, vacio):
    j = 0

    for i in range(n, 0, -2):
        print(vacio*j, simbolo*i, vacio*j, sep="")
        j += 1

    k = int((n-1)/2) - 1

    for i in range(3, n+1, 2):
        print(vacio*k, simbolo*i, vacio*k, sep="")
        k -= 1

    print()


def rombo(n, simbolo, vacio):
    k = int((n-1)/2)

    for i in range(1, n, 2):
        print(vacio*k, simbolo*i, vacio*k, sep="")
        k -= 1

    j = 0

    for i in range(n, 0, -2):
        print(vacio*j, simbolo*i, vacio*j, sep="")
        j += 1

    print()


def mono(n, simbolo, vacio):
    j = n-2

    for i in range(1, int((((n-1)/2)+1))):
        print(simbolo*i, vacio*j, simbolo*i, sep="")
        j -= 2

    print(simbolo*n)

    k = 1

    for i in range(int(((n-1)/2)), 0, -1):
        print(simbolo*i, vacio*k, simbolo*i, sep="")
        k += 2

    print()

#Dibuja una copa
def copa(n, simbolo, vacio):
    j = 0

    for i in range(n, 0, -2):
        print(vacio*j, simbolo*i, vacio*j, sep="")
        j += 1

    j -= 2

    for i in range(1, int(((n-1)/2))):
        print(vacio*j, simbolo, vacio*j)

    print(simbolo*n)
    print()


def reloj_hueco(n, simbolo, vacio):
    print(simbolo*n)

    j = 1

    for i in range((n-4), 0, -2):
        print(vacio*j, simbolo, vacio*i, simbolo, vacio*j, sep="")
        j += 1

    k = int((n-1)/2)

    print(vacio*k, simbolo, vacio*k, sep="")

    for i in range(1, (n-3), 2):
        k -= 1
        print(vacio*k, simbolo, vacio*i, simbolo, vacio*k, sep="")

    print(simbolo*n)
    print()


def rombo_hueco(n, simbolo, vacio):
    k = int((n-1)/2)

    print(vacio*k, simbolo, vacio*k, sep="")

    for i in range(1, n, 2):
        k -= 1
        print(vacio*k, simbolo, vacio*i, simbolo, vacio*k, sep="")

    j = 1

    for i in range(n-4, -1, -2):
        print(vacio*j, simbolo, vacio*i, simbolo, vacio*j, sep="")
        j += 1

    k = int((n-1)/2)

    print(vacio*k, simbolo, vacio*k, sep="")
    print()


def mono_hueco(n, simbolo, vacio):
    j = n-2

    for i in range(1, int((((n-1)/2)+1))):
        if i == 1:
            lado = simbolo
        else:
            lado = simbolo+vacio*(i-2)+simbolo

        print(lado, vacio*j, lado, sep="")
        j -= 2

    print(simbolo, vacio*int((n-3)/2), simbolo, vacio*int((n-3)/2), simbolo, sep="")

    k = 1

    for i in range(int(((n-1)/2)), 0, -1):
        if i == 1:
            lado = simbolo
        else:
            lado = simbolo+vacio*(i-2)+simbolo

        print(lado, vacio*k, lado, sep="")
        k += 2

    print()


def copa_hueca(n, simbolo, vacio):
    print(simbolo*n)

    j = 1

    for i in range(n-2, 0, -2):
        if i == 1:
            print(vacio*j, simbolo, sep="")
        else:
            print(vacio*j, simbolo, vacio*(i-2), simbolo, sep="")

        j += 1

    j -= 2

    for i in range(1, int(((n-1)/2))):
        print(vacio*j, simbolo, vacio*j)

    print(simbolo*n)
    print()


def dimension():
    while True:
        dimensionus = input("Introduce la dimensión impar (>=5 y <= 25): ")

        try:
            n = int(dimensionus)
        except ValueError:
            print("La dimensión debe ser un número entero.")
            continue

        if not isinstance(n, int):
            print("La dimensión debe ser un número entero.")
        elif n < 5 or n > 25:
            print("La dimensión debe ser mayor o igual a 5 y menor o igual a 25.")
        elif n % 2 == 0:
            print("La dimensión debe ser impar.")
        else:
            return n


def get_simbolo():
    while True:
        simbolo = input("Introduce el símbolo: ")

        if not isinstance(simbolo, str):
            print("El símbolo debe ser texto.")
        elif len(simbolo) != 1:
            print("Escribe solo un símbolo")
        else:
            return simbolo


def menu():
    n = dimension()
    simbolo = get_simbolo()
    vacio = " "

    while True:
        print("1. Reloj de arena")
        print("2. Rombo")
        print("3. Moño")
        print("4. Copa")
        print("5. Reloj de arena hueco")
        print("6. Rombo hueco")
        print("7. Moño hueco")
        print("8. Copa hueca")
        print("9. Todas las figuras")
        print("0. Salir")

        opcion = int(input("Elige una opción: "))

        if not isinstance(opcion, int) or opcion < 0 or opcion > 9:
            print("No existe esa opción.")
        elif opcion == 0:
            print("Hasta luego.")
            break
        elif opcion == 1:
            reloj(n, simbolo, vacio)
        elif opcion == 2:
            rombo(n, simbolo, vacio)
        elif opcion == 3:
            mono(n, simbolo, vacio)
        elif opcion == 4:
            copa(n, simbolo, vacio)
        elif opcion == 5:
            reloj_hueco(n, simbolo, vacio)
        elif opcion == 6:
            rombo_hueco(n, simbolo, vacio)
        elif opcion == 7:
            mono_hueco(n, simbolo, vacio)
        elif opcion == 8:
            copa_hueca(n, simbolo, vacio)
        elif opcion == 9:
            reloj(n, simbolo, vacio)
            rombo(n, simbolo, vacio)
            mono(n, simbolo, vacio)
            copa(n, simbolo, vacio)
            reloj_hueco(n, simbolo, vacio)
            rombo_hueco(n, simbolo, vacio)
            mono_hueco(n, simbolo, vacio)
            copa_hueca(n, simbolo, vacio)


menu()
