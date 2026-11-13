import tkinter as tk
import random

ANCHO = 400
ALTO = 400
TAM = 20
ventana= tk.Tk()
ventana.title("serpiente")
canvas = tk.Canvas(ventana, width=ANCHO, height=ALTO, bg="black")
canvas.pack()
serpiente = [(200,200),(180,200),(160,200)]
direccion = "Right"

def nueva_manzana():
    x=random.randrange(0, ANCHO, TAM)
    y=random.randrange(0, ALTO, TAM)
    return (x,y)

manzana = nueva_manzana()
puntos = 0

def cambiar_direccion(event):
    global direccion
    tecla = event.keysym
    if tecla =="Up" and direccion != "Down":
        direccion = "Up"
    if tecla =="Down" and direccion != "Up":
        direccion = "Down"
    if tecla == "Left" and direccion != "Right":
        direccion = "Left"
    if tecla == "Right" and direccion != "Left":
        direccion = "Right"
ventana.bind("<Key>", cambiar_direccion)

def mover():
    global manzana, puntos, serpiente
    
    cabeza_x, cabeza_y = serpiente[0]
    
    if direccion == "Up":
        cabeza_y -= TAM
    if direccion == "Down":
        cabeza_y += TAM
    if direccion =="Left":
        cabeza_x -= TAM
    if direccion == "Right":
        cabeza_x += TAM
    nueva_cabeza = (cabeza_x, cabeza_y)
    
    if (cabeza_x < 0 or cabeza_x >= ANCHO or cabeza_y<0 or cabeza_y >= ALTO or nueva_cabeza in serpiente):
        canvas.create_text(200,200, text=f"GAME OVER\nPuntos: {puntos}", fill="white", font=("Arial", 20))
    serpiente.insert(0, nueva_cabeza)
    
    if nueva_cabeza == manzana:
        puntos += 1
        manzana = nueva_manzana()
    else:
        serpiente.pop()
    
    canvas.delete("all")
    for x,y in serpiente:
        canvas.create_rectangle(x, y,x+TAM, y+TAM, fill="green")
    mx, my = manzana
    canvas.create_oval(mx,my, mx+TAM, my+TAM, fill="red")
    
    ventana.after(150, mover)
    
mover()
ventana.mainloop()