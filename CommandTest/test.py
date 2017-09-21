import requests
import json
import nxt.locator
import nxt.motor

r = requests.get("https://robocode-server.herokuapp.com/code/90")

data = r.json()

address = data["address"]
commands = data["commands"]

b_ = nxt.locator.find_one_brick();

if b_ != 0:
	b = b_.connect()

medium_motor = nxt.motor.Motor(b, nxt.motor.PORT_A)
large_motor = nxt.motor.Motor(b, nxt.motor.PORT_B)

for command in commands:
	print("Command: " + command["type"])
	if command["type"] == "sound":
		print("Frequency: " + command["freq"])
		print("Duration: " + command["duration"])
		b.play_tone(command["freq"], command["duration"])

	elif command["type"] == "motor_medium":
		tacho_lim = command["revolutions"]*360
		medium_motor.update(50, tacho_lim, True)

	elif command["type"] == "Medium Motor":
		tacho_lim = command["rotations"]*360
		medium_motor.update(command["power"], tacho_lim, command["brake"])

	elif command["type"] == "Large Motor":
		tacho_lim = command["rotations"]*360
		large_motor.update(command["power"], tacho_lim, command["brake"])

	elif command["type"] == "Move Steering":
		tacho_lim = command["rotations"]*360
		large_motor.update(command["power"], tacho_lim, command["brake"])
		medium_motor.stop()

	elif command["type"] == "Move Tank":
		tacho_lim = command["rotations"]*360
		large_motor.update(command["powerLeft"], tacho_lim, command["brake"])
		large_motor.update(command["powerRight"], tacho_lim, command["brake"])

	else:
		print("Command not found")