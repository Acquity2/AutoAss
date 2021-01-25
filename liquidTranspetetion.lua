local liquidRecipe = require('liquidRecipe')
local liquidTransfer = require('liquidTransfer')
local liquidPosation = require('liquidPosation')
local robotCoordinateMovement = require('robotCoordinateMovement')

liquidTranspetetion = {}

function liquidTranspetetion.main(key)
	 now1 = 1
	 Recipe1 = liquidRecipe[key]
	for k,v in pairs(Recipe1) do -- Recipe里的key是目标输入仓位置，value.type是种类，value.amount是量
		type1 = v.type
		target1 = liquidPosation[type1]
		amount1 = v.amount
		amount1 = amount1 + 1 - 1
		print(target1,now1,amount1)
		liquidTransfer.drain(target1,now1,amount1)
		now1 = target1
		k = k+1-1
		liquidTransfer.fill(k,now1,amount1)
		if k > 1 then robotCoordinateMovement.moveTo(k,1) end
		now1 = 1
	end
	print("Transfer Complete")
end

return liquidTranspetetion