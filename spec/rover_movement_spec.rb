require_relative '../rover_movement'

RSpec.describe "Let's learn to move the rover on mars, by first writing specs" do

    context "validate if the rover is in working state" do
        it "should just validate if the rover moves in left direction" do
            expect(move_rover('N')).to eq('W')
        end
    end

    context "validate if the rover moves in all the directions as expected" do
        it "should check if the rover face direction before movement and after movement are as expected" do
            expect (move_rover_in_any_direction('E')).to eq('N')
        end
    end
end