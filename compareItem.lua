local component = require("component")
local md5 = require("md5")
local sides = require("sides")
local getItemInInventory_function = require("getItemInInventory_function")
local md5List = require('md5List')

compareItem = {}

function compareItem.caculateMd5(fileLoc)
	local file = io.open("fileLoc","w")
	local content = file:read('*a') 
	local MD5 = md5.sumhexa(content)
	return MD5
end

function compareItem.compare(md5Code)
	key = nil
	for k,v in pairs(md5List) do
		if md5Code == v then 
		key = k
		print("Find Matching MD5, key="..key)
		end
	end
	if key == nil then
		print("No Matching MD5")
	else
		return key
	end
end	

function compareItem.getMd5Code(fileLoc,amount,sides)
	getItemInInventory_function.writeToFile(fileLoc,amount,sides)
	md5Code = compareItem.caculateMd5(fileLoc)
	return md5Code
end

function compareItem.Main(fileLoc,amount,sides)
	Md5code = compareItem.getMd5Code(fileLoc,amount,sides)
	Key = compareItem.compare(Md5code)
	return Key
end

return compareItem