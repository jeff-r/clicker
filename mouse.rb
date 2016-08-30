require "java"
java_import "java.awt.MouseInfo"
java_import "java.awt.Robot"
java_import "java.awt.event.InputEvent"

Struct.new "Point", :x, :y

class Mouse
  def initialize
    @last_position = position
  end

  def position
    result = MouseInfo.getPointerInfo
    x = result.getLocation.getX
    y = result.getLocation.getY
    point = Struct::Point.new x,y
  end

  def has_moved?
    new_position = position
    stationary = new_position.x == @last_position.x && new_position.y == @last_position.y
    @last_position = new_position
    !stationary
  end

  def left_down
    robot.mousePress left_button_mask
  end

  def left_up
    robot.mouseRelease left_button_mask
  end

  def left_click
    left_down
    left_up
  end

  private
  def robot
    @robot ||= Robot.new
  end

  def left_button_mask
    InputEvent.getMaskForButton 1
  end
end
