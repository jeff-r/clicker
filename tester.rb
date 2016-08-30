require "./mouse.rb"

mouse = Mouse.new

10.times do
  position = mouse.position
  puts position.x
  sleep 1
end
