require "./mouse.rb"

mouse = Mouse.new

while true do
  puts mouse.has_moved?
  sleep 1
end

