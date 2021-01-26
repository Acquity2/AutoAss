local component = require('component')
local robot = require('robot')
local robotCoordinateMovement = require('robotCoordinateMovement')
local sides = require('sides')

moveItem = {}

function moveItem.Input(solt)
	robot.select(solt)
	component.inventory_controller.suckFromSlot(sides.down,solt)
end

function moveItem.Output(solt)
	robot.select(solt)
	component.inventory_controller.dropIntoSlot(sides.up,1)
end

function moveItem.Main()
	robot.select(1)
	local i = 1
	local Now = 1
	local Target = 1
	while i < 14 do
		moveItem.Input(i)
		i = i+1
	end
	robot.select(1)
	while Now < 14 do
		moveItem.Output(Now)
		Target = Now + 1
		robotCoordinateMovement.moveTo(Now,Target)
		Now = Now + 1
	end
	Target = 1
	robotCoordinateMovement.moveTo(Now,Target)
	print("Item Transfer Complete!!")
end
return moveItem

