from machine import Pin, PWM
import time

# Set the pin number for the piezo buzzer
buzzer1_pin = 0

# Initialize the PWM object
pwm = PWM(Pin(buzzer1_pin))

# Define a function to play a tone
def play1_tone(frequency, duration):
    pwm.freq(frequency)
    pwm.duty(512)
    time.sleep(duration)
    pwm.duty(0)

# Play a tone for 1 second
#play1_tone(261, 1)

# Define a melody as a list of tuples (frequency, duration)
melody = [(261, 0.5), (293, 0.5), (329, 0.5), (349, 0.5), (392, 0.5), (440, 0.5), (493, 0.5), (523, 0.5)]

# Play the melody
for note in melody:
    play_tone(note[0], note[1])

