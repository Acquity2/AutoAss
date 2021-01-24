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