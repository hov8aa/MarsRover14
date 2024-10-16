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
    end

    context "validate if the rover moves forward in all the directions as exepcted" do
        it "should match the new position and expected position of rover in any direction with series of instructions " do
            expect(move_rover_forward_anywhere(1,2,'N','LMLMLMLMM')).to eq([1,3])
        end
    end

=begin
    context "" do
        it "" do
            expect().to eq()
        end
    end
=end

end