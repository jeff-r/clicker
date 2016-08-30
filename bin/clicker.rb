require "./lib/mouse.rb"
require "./lib/mouse_tracker"

mouse = Mouse.new
tracker = MouseTracker.new mouse

while true do
  tracker.tick
  sleep 0.1
end

