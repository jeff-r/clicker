require "java"
java_import "java.awt.MouseInfo"
java_import "java.awt.Robot"
java_import "java.awt.event.InputEvent"

Struct.new "Point", :x, :y

class Mouse
  attr_reader :button_is_up

  def initialize
    @last_position = position
    @button_is_up = true
  end

  def position
    result = MouseInfo.getPointerInfo
    x = result.getLocation.getX
    y = result.getLocation.getY
    point = Struct::Point.new x,y
  end

  def button_is_down
    !@button_is_up
  end

  def has_moved?
    new_position = position
    stationary = new_position.x == @last_position.x && new_position.y == @last_position.y
    @last_position = new_position
    !stationary
  end

  def left_down
    puts "down"
    robot.mousePress left_button_mask
    @button_is_up = false
  end

  def left_up
    puts "up"
    robot.mouseRelease left_button_mask
    @button_is_up = true
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
