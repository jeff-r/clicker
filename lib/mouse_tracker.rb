class MouseTracker
  def initialize(mouse)
    @mouse = mouse
    @moving = false
  end

  def tick
    moving = @mouse.has_moved?

    puts "moving" if moving
  end

  def time_to_click?
  end
end
