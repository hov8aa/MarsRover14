require "sinatra"
require_relative 'rover_movement.rb'

get "/" do
    redirect to('/index')
end

get '/index' do
    "Sinatra app is running as exepcted."
end

#Test this function using http://localhost:4567/turn_rover_left?direction=S
get '/turn_rover_left' do
    direction = params['direction'].upcase
    result = turn_rover_left(direction)
    "The result is #{result}"
end

#Test this function using http://localhost:4567/turn_rover_right?direction=S
get '/turn_rover_right' do
    direction = params['direction'].upcase
    result = turn_rover_right(direction)  
    "The result is #{result}"
end

#Test this function using http://localhost:4567/move_rover_forward?rover_x_coordinate=10&rover_y_coordinate=33
get '/move_rover_forward' do
    rover_x_coordinate = params['rover_x_coordinate'].to_i
    rover_y_coordinate = params['rover_y_coordinate'].to_i
    result = move_rover_forward(rover_x_coordinate,rover_y_coordinate)
    "The result is #{result}"
end

