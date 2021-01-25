local autoAssMain = require('autoAssMain')
local robot = require('robot')
local component = require('component')
local sides = require('sides')
local os = require('os')

while true do
	robot.select(1)
	local A,B = {}
	A = component.inventory_controller.getStackInSlot(sides.down,1)
	B = component.inventory_controller.getStackInSlot(sides.up,1)
	if A ~= nil then
		if B == nil then 
			print('start')
			autoAssMain.Main()
		end
	end
	os.sleep(0.5)
end