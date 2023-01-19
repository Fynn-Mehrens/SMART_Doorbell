# boot.py -- run on boot-up
import network
import time
import machine

ssid = 'Ziggo6BBE93F'
password = 'zza7rGamdzGt'
station = network.WLAN(network.STA_IF)

station.active(True)
station.connect(ssid, password)

start = time.time()
while station.isconnected() == False:
    pass