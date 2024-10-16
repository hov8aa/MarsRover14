require_relative '../rover_movement'

RSpec.describe "Let's learn to move the rover on mars, by first writing specs" do

    context "validate if the rover is in working state" do
        it "should just validate if the rover moves in left direction" do
            expect(move_rover('N')).to eq('W')
        end
    end

    context "validate if the rover moves in all the directions as expected" do
        it "should check if the rover face direction before left turn and after left turn are as expected" do
            expect(turn_rover_left('E')).to eq('N')
        end

        it "should check if the rover face direction before right turn and after right turn are as expected" do
            expect(turn_rover_right('E')).to eq('S')
        end
    end

    context "validate if the rover moves forward as exepcted" do
        it "should match the new position and expected position of the rover" do
            expect(move_rover_forward(1,2)).to eq([1,3])
        end

        it "should match the new position and expected position of the rover" do
            expect(move_rover_forward_in_any_direction(1,2,'N')).to eq([1,3])
        end
    end

    context "validate if the rover moves forward in all the directions as exepcted" do
        it "should match the new position and expected position of rover in any direction with series of instructions" do
            expect(move_rover_forward_anywhere(1,2,'N','LMLMLMLMM')).to eq([1,3])
        end

        it "should match the new position & rover face with expected position of rover and face in any direction with series of instructions" do
            expect(move_rover_forward_anywhere_with_direction_knowledge(1,2,'N','LMLMLMLMM')).to eq([1,3,'N'])
        end

        it "should match the new position & rover face with expected position of rover and face in any direction with series of instructions" do
            expect(move_rover_forward_anywhere_with_direction_knowledge(3,3,'E','MMRMMRMRRM')).to eq([5,1,'E'])
        end
    end

    context "validate if the rover moves within plateau boundaries" do
        it "should find out the final position of rover and see if it's within plateau boundaries" do
            expect(move_rover_forward_within_plateau_boundaries(5,5,3,3,'E','MMRMMRMRRM')).to be true
        end

        it "should find out the final position of rover and see if it's within plateau boundaries" do
            expect(move_rover_forward_within_plateau_boundaries(5,5,3,3,'E','MMRMMRMRRMMMMMMMMMMMMMMMMMM')).to be false
        end
    end

end