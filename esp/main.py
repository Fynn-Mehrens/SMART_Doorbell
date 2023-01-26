import urequests as requests
import machine
import neopixel
from machine import Pin

# define interrupt handling functions
def button_handler(pin):
  global button_pressed
  button_pressed = pin

# configure pushbuttons as interrupts
button1 = Pin(14, Pin.IN) #red
button1.irq(trigger=Pin.IRQ_RISING, handler=button_handler)
button2 = Pin(12, Pin.IN) #green
button2.irq(trigger=Pin.IRQ_RISING, handler=button_handler)
button3 = Pin(13, Pin.IN) #blue
button3.irq(trigger=Pin.IRQ_RISING, handler=button_handler)

button_pressed = None


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

url = "http://192.168.178.31:5000" # local IP address of the server machine

# TODO: What are the assumptions on the buttons?
while True:
  if button_pressed == button1:
    red()
    requests.get(url + "/doorbell_ring/1")
  elif button_pressed == button2:
    green()
    requests.get(url + "/doorbell_ring/2")
    print("Slot 2 pressed")
  elif button_pressed == button3:
    blue()
    requests.get(url + "/doorbell_ring/3")
  else:
    clear()


