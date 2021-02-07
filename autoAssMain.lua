local liquidTranspetetion = require('liquidTranspetetion')
local moveItem = require('moveItem')
local compareItem = require('compareItem')
local sides = require('sides')

autoAssMain = {}

fileLoc = '/tmp/fullItemList.xml'
amount = 3
side = sides.down

function autoAssMain.Main()
	local Key = nil
	Key = compareItem.Main(fileLoc,amount,side)
	print("step.1 find matched md5")
	if Key == nil then print("error  no matched md5") goto brea end
	if Key == 6 then
		moveItem.rocketMain()
	else
		moveItem.Main()
	end
	liquidTranspetetion.main(Key)
	
	
	::brea::
end


return autoAssMain