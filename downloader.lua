local component = require("component")


if not component.isAvailable("internet") then
	io.stderr:write("This application requires an internet card")
	return
end

local inter2 = component.internet
if not inter2.isHttpEnabled() then
	io.stderr:write("Internet connections are currently disabled in game config")
	return
end

local internet = require("internet")


local FileList = {
	{FileName = "Trigger.lua", Url = "https://gitee.com/acquity2/AutoAss/raw/main/Trigger.lua"},
	{FileName = "autoAssMain.lua", Url = "https://gitee.com/acquity2/AutoAss/raw/main/autoAssMain.lua"},
	{FileName = "calculateMd5.lua", Url = "https://gitee.com/acquity2/AutoAss/raw/main/calculateMd5.lua"},
	{FileName = "compareItem.lua", Url = "https://gitee.com/acquity2/AutoAss/raw/main/compareItem.lua"},
	{FileName = "getItemInInventory.lua", Url = "https://gitee.com/acquity2/AutoAss/raw/main/getItemInInventory.lua"},
	{FileName = "getItemInInventory_function.lua", Url = "https://gitee.com/acquity2/AutoAss/raw/main/getItemInInventory_function.lua"},
	{FileName = "liquidPosation.lua", Url = "https://gitee.com/acquity2/AutoAss/raw/main/liquidPosition.lua"},
	{FileName = "liquidRecipe.lua", Url = "https://gitee.com/acquity2/AutoAss/raw/main/liquidRecipe.lua"},
	{FileName = "liquidTransfer.lua", Url = "https://gitee.com/acquity2/AutoAss/raw/main/liquidTransfer.lua"},
	{FileName = "liquidTranspetetion.lua", Url = "https://gitee.com/acquity2/AutoAss/raw/main/liquidTranspetetion.lua"},
	{FileName = "md5.lua", Url = "https://gitee.com/acquity2/AutoAss/raw/main/md5.lua"},
	{FileName = "md5List.lua", Url = "https://gitee.com/acquity2/AutoAss/raw/main/md5List.lua"},
	{FileName = "moveItem.lua", Url = "https://gitee.com/acquity2/AutoAss/raw/main/moveItem.lua"},
	{FileName = "robotCoordinateMovement.lua", Url = "https://gitee.com/acquity2/AutoAss/raw/main/robotCoordinateMovement.lua"}
	--{FileName = "", Url = ""}
}




function download(FileName,Location,Url)

	local arpmUrl = Url
	local additionalHeaders = {
		--["User-Agent"] = "ARPM/dropper" -- Gitlab returns HTTP 403 when default user agent is used (e.g. Java/1.8.0_131)
	}
	local saveFile = Location..FileName
	print("Downloading to " .. saveFile)
	local content = ""
	local response = internet.request(arpmUrl, nil, additionalHeaders)
	for chunk in response do
		content = content .. chunk
	end

	local handle = io.open(saveFile, "w")
	handle:write(content)
	handle:close()
	print(FileName.."Download complete")

end

for k,v in pairs(FileList) do
	local _Location = "/home/autoAss/"
	local _FileNmae = v.FileName
	local _Url = v.Url
	download(_FileNmae,_Location,_Url)
end