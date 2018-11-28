require 'rails_helper'

RSpec.describe NumberExercise, type: :model do
  describe "BinaryGap" do
  	it "returns nil if N is outside of [1..2,147,483,647]" do
  		expect(NumberExercise.BinaryGap(0)).to be nil
  		expect(NumberExercise.BinaryGap(2147483648)).to be nil
  	end

  	it "returns 0 if there is no binary gap" do 
  		expect(NumberExercise.BinaryGap(15)).to be 0
  	end

  	it "gets the binary gap for numbers with only one gap" do 
  		expect(NumberExercise.BinaryGap(9)).to be 2
  	end

  	it "gets the longest binary gap for numbers with more than one gap" do
  		expect(NumberExercise.BinaryGap(529)).to be 4
  	end

  end
end
