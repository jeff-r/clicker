require "java"
java_import "java.awt.MouseInfo"
java_import "java.awt.Robot"
java_import "java.awt.event.InputEvent"

Struct.new "Point", :x, :y

class Mouse
  def position
    result = MouseInfo.getPointerInfo
    x = result.getLocation.getX
    y = result.getLocation.getY
    point = Struct::Point.new x,y
  end

  def down

  end
end

