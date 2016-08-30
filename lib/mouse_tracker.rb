
class MouseTracker
  attr_reader :mouse, :dwell_time, :drag_time, :drag_or_click, :ticks_to_event

  def initialize(mouse:, dwell_time: 3, drag_time: 2, drag_or_click: :drag)
    @mouse = mouse
    @dwell_time = dwell_time
    @drag_or_click = drag_or_click
    @moving = false
    @stationary_ticks = dwell_time
    @ticks_to_event = 0
    @drag_time = drag_time
  end

  def moving?
    @moving
  end

  def tick
    # STDOUT.write(".")
    @moving = mouse.has_moved?
    if @moving
      @stationary_ticks = 0
      set_ticks_to_event
      if @mouse.button_is_down
        mouse.left_down
      end
    else
      @stationary_ticks += 1
      if @stationary_ticks == ticks_to_event
        if mouse.button_is_up
          @stationary_ticks = 0
          mouse.left_down
        else
          mouse.left_up
          @stationary_ticks = @dwell_time
        end
        set_ticks_to_event
      end
    end
  end

  def set_ticks_to_event
    if drag_or_click == :drag
      if mouse.button_is_up
        @ticks_to_event = @dwell_time
      else
        @ticks_to_event = @drag_time
      end
    else
    end

  end

  def time_to_click?
  end
end
