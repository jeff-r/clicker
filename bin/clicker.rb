require "./lib/mouse.rb"
require "./lib/mouse_tracker"

mouse = Mouse.new
tracker = MouseTracker.new(mouse: mouse, dwell_time: 6, drag_time: 1, drag_or_click: :drag)

while true do
  tracker.tick
  sleep 0.05
end
