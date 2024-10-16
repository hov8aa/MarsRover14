def move_rover(direction)
    return 'W'
end

def turn_rover_left(direction)
    if direction == 'N'
        return 'W'
    elsif direction == 'W'
        return 'S'
    elsif direction == 'S'
        return 'E'
    elsif direction == 'E'
        return 'N'
    end
end

def turn_rover_right(direction)
    if direction == 'N'
        return 'E'
    elsif direction == 'E'
        return 'S'
    elsif direction == 'S'
        return 'W'
    elsif direction == 'W'
        return 'N'
    end
end

def move_rover_forward(rover_x_coordinate, rover_y_coordinate)
    return rover_x_coordinate, rover_y_coordinate+1
end

def move_rover_forward_in_any_direction(rover_x_coordinate, rover_y_coordinate,direction)
    if direction == 'N'
        return rover_x_coordinate, rover_y_coordinate+1
    elsif direction == 'W'
        return rover_x_coordinate-1, rover_y_coordinate
    elsif direction == 'S'
        return rover_x_coordinate, rover_y_coordinate-1
    elsif direction == 'E'
        return rover_x_coordinate+1, rover_y_coordinate
    end
end

def move_rover_forward_anywhere(rover_x_coordinate,rover_y_coordinate,direction,instructions)
    i=0
    while i <= instructions.length
        if instructions[i] == 'L'
            direction = turn_rover_left(direction)
        elsif instructions[i] == 'R'
            direction = turn_rover_right(direction)
        elsif instructions[i] == 'M'
            rover_x_coordinate,rover_y_coordinate = move_rover_forward_in_any_direction(rover_x_coordinate,rover_y_coordinate,direction)
        end
        i+=1
    end
    return rover_x_coordinate, rover_y_coordinate
end

def move_rover_forward_anywhere_with_direction_knowledge(rover_x_coordinate,rover_y_coordinate,direction,instructions)
    i=0
    while i < instructions.length
        if instructions[i] == 'L'
            direction = turn_rover_left(direction)
        elsif instructions[i] == 'R'
            direction = turn_rover_right(direction)
        elsif instructions[i] == 'M'
            rover_x_coordinate,rover_y_coordinate = move_rover_forward_in_any_direction(rover_x_coordinate,rover_y_coordinate,direction)
        end
        i+=1
    end
    return rover_x_coordinate, rover_y_coordinate, direction
end

def move_rover_forward_within_plateau_boundaries(plateau_x_coordinate, plateau_y_coordinate, rover_x_coordinate,rover_y_coordinate,direction,instructions)
    rover_x_coordinate, rover_y_coordinate = move_rover_forward_anywhere(rover_x_coordinate, rover_y_coordinate, direction, instructions)

    if (rover_x_coordinate <= plateau_x_coordinate) && (rover_y_coordinate <= plateau_y_coordinate) && (rover_x_coordinate >=0) && (rover_y_coordinate >=0)
        return true
    elsif (rover_x_coordinate > plateau_x_coordinate) || (rover_y_coordinate > plateau_y_coordinate) || (rover_x_coordinate <0) || (rover_y_coordinate <0)
        return false
    end
end