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

#Test this function using http://localhost:4567/move_rover_forward_in_any_direction?rover_x_coordinate=10&rover_y_coordinate=33&direction=N
get '/move_rover_forward_in_any_direction' do
    rover_x_coordinate = params['rover_x_coordinate'].to_i
    rover_y_coordinate = params['rover_y_coordinate'].to_i
    direction = params['direction'].upcase
    result = move_rover_forward_in_any_direction(rover_x_coordinate,rover_y_coordinate,direction)
    "The result is #{result}"
end

#http://localhost:4567/move_rover_forward_anywhere?rover_x_coordinate=10&rover_y_coordinate=33&direction=N&instructions=LMLMLMLMM
get '/move_rover_forward_anywhere' do
    rover_x_coordinate = params['rover_x_coordinate'].to_i
    rover_y_coordinate = params['rover_y_coordinate'].to_i
    direction = params['direction'].upcase
    instructions = params['instructions'].upcase
    result = move_rover_forward_anywhere(rover_x_coordinate,rover_y_coordinate,direction,instructions)
    "The result is #{result}"
end

#http://localhost:4567/move_rover_forward_anywhere_with_direction_knowledge?rover_x_coordinate=10&rover_y_coordinate=33&direction=N&instructions=LMLMLMLMM
#http://localhost:4567/move_rover_forward_anywhere_with_direction_knowledge?rover_x_coordinate=1&rover_y_coordinate=2&direction=N&instructions=LMLMLMLMM
get '/move_rover_forward_anywhere_with_direction_knowledge' do
    rover_x_coordinate = params['rover_x_coordinate'].to_i
    rover_y_coordinate = params['rover_y_coordinate'].to_i
    direction = params['direction'].upcase
    instructions = params['instructions'].upcase
    result = move_rover_forward_anywhere_with_direction_knowledge(rover_x_coordinate,rover_y_coordinate,direction,instructions)
    "The result is #{result}"
end

#http://localhost:4567/move_rover_forward_anywhere_with_direction_knowledge?plateau_x_coordinate=5&plateau_y_coordinate=5&rover_x_coordinate=1&rover_y_coordinate=2&direction=N&instructions=LMLMLMLMM
get '/move_rover_forward_within_plateau_boundaries' do
    plateau_x_coordinate = params['plateau_x_coordinate'].to_i
    plateau_y_coordinate = params['plateau_y_coordinate'].to_i
    rover_x_coordinate = params['rover_x_coordinate'].to_i
    rover_y_coordinate = params['rover_y_coordinate'].to_i
    direction = params['direction'].upcase
    instructions = params['instructions'].upcase
    result = move_rover_forward_within_plateau_boundaries(plateau_x_coordinate,plateau_y_coordinate,rover_x_coordinate,rover_y_coordinate,direction,instructions)
    "The result is #{result}"
end