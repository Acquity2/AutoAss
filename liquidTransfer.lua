local component = require('component')
local robot = require('robot')
local robotCoordinateMovement = require('robotCoordinateMovement')

liquidTransfer = {}

function liquidTransfer.drain(targetPosition,now,amount)
	robotCoordinateMovement.moveTo(now,targetPosition)
	Br = robot.drainDown(amount)
	if Br == false then 
		print("ERROR!!! No fluid") 
	else
		print("Success")
		end
end

function liquidTransfer.fill(targetPosition,now,amount)
	robotCoordinateMovement.moveTo(now,targetPosition)
	robot.turnLeft()
	robot.fill(amount)
	robot.turnRight()
end
return liquidTransfer