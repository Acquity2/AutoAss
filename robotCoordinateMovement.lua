local robot = require("robot")
local robotCoordinateMovement = {}
function robotCoordinateMovement.moveTo(x,n)  ------x为机器人所在坐标，n为希望移动到的坐标
  local i = 0
  local difference = n - x
  if difference >= 0 
  then
    while i < difference do
      robot.forward()
      i = i + 1
    end
  else
    difference = 0 - difference
    while i < difference do
      robot.back()
      i = i + 1
    end
  end
end
return robotCoordinateMovement
