local component = require("component")
local sides = require("sides")

fileLocation = "/tmp/fullItemList.xml"
count = 3
side = sides.down


createFile = io.open(fileLocation,"wb")
createFile:write("List:")
createFile:close()

function get_item_information_in_slot(slot,allSlots)
	local A = allSlots
	local name,damage,size = nil
	name = A[slot]["name"]
	damage = A[slot]["damage"]
	size = A[slot]["size"]
	print(name,damage,size)
	if name == nil 
	then 
		return "No Item In This Slot"
	else
		B = name .. "  " .. damage .. "  " .. size
		return B
	end
	
end


function add_new_line_write_something(filename,contents)
    local file = io.open(filename, "rb")
    local content = file:read("*all")
    content = content .. "\n"
    file:close()
    file = io.open(filename, "w")
    file:write(content)
    file:close()
	local file1 = io.open(filename,"a")
	file1:write(contents)
	file1:close()
end


a = 0
information_table = component.inventory_controller.getAllStacks(side).getAll()

while a < count do
	itemInformation = get_item_information_in_slot(a,information_table)
	add_new_line_write_something(fileLocation,itemInformation)
	a = a + 1
end
	

