import machine
import neopixel
import time
from machine import Pin
from time import sleep

# define interrupt handling functions
def button_handler(pin):
  global button_pressed
  button_pressed = pin

# configure pushbuttons as interrupts
#button1 = Pin(15, Pin.IN) #clear
#button1.irq(trigger=Pin.IRQ_RISING, handler=button_handler) 
button2 = Pin(14, Pin.IN) #red
button2.irq(trigger=Pin.IRQ_RISING, handler=button_handler)
button3 = Pin(12, Pin.IN) #green
button3.irq(trigger=Pin.IRQ_RISING, handler=button_handler)
button4 = Pin(13, Pin.IN) #blue
button4.irq(trigger=Pin.IRQ_RISING, handler=button_handler)

button_pressed = button1


# LED strip configuration
# number of pixels
n = 17
# strip control gpio
p = 5 
np = neopixel.NeoPixel(machine.Pin(p), n)

# turn all pixels red
def red():
  for i in range(0, 5):
    np[i] = (255, 0, 0)
    np.write()

# turn all pixels green
def green():
  for i in range(6, 11):
    np[i] = (0, 255, 0)
    np.write()

# turn all pixels blue
def blue():
  for i in range(11, 17):
    np[i] = (0, 0, 255)
    np.write()

# turn all pixels off
def clear():
  for i in range(n):
    np[i] = (0, 0, 0)
    np.write()

# turn all pixels on
def white():
  for i in range(n):
    np[i] = (255, 255, 255)
    np.write()

while True:
  if button_pressed == button1:
    white()
  elif button_pressed == button2:
    red()
  elif button_pressed == button3:
    green()
  elif button_pressed == button4:
    blue()
  else:
    clear()

