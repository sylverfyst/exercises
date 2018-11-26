require 'rails_helper'

RSpec.describe StringExercise, type: :model do
  	describe "allUnique?" do
		it "returns true for an empty or one element string" do
			expect(StringExercise.allUnique?("")).to be true
			expect(StringExercise.allUnique?("a")).to be true
		end

		it "returns true for a string with no duplicate characters" do
			expect(StringExercise.allUnique?("12")).to be true
			expect(StringExercise.allUnique?("abc")).to be true
		end

		it "returns false for a string with duplicate characters" do
			expect(StringExercise.allUnique?("aa")).to be false
			expect(StringExercise.allUnique?("121312")).to be false
		end

		it "properly handles embedded newlines" do
			expect(StringExercise.allUnique?("abc\n123")).to be true
			expect(StringExercise.allUnique?("abc\nabc")).to be false
			expect(StringExercise.allUnique?("abc\n123\n")).to be false
		end
	end

	describe "is_perm?" do
		it "returns false if b is greater in length than a" do
			expect(StringExercise.is_perm?("123", "1234")).to be false
			expect(StringExercise.is_perm?("", "1")).to be false
		end

		it "returns true if b is empty or nil" do
			expect(StringExercise.is_perm?("123", "")).to be true
			expect(StringExercise.is_perm?("123", nil)).to be true
		end

		it "returns true if b is a permutation of a with one char" do
			expect(StringExercise.is_perm?("123", "1")).to be true
		end
	end

	describe "longestUnique" do 
		it "returns 0 for nil or empty strings" do 
			expect(StringExercise.longestUnique("")).to be 0
			expect(StringExercise.longestUnique(nil)).to be 0
		end

		it "returns 1 for strings of length 1" do
			expect(StringExercise.longestUnique("a")).to be 1
		end

		it "returns 1 for strings of any length containing repeats of only 1 char" do 
			expect(StringExercise.longestUnique("aaaaaaaa")).to be 1
		end

		it "returns size of the string for all unique strings" do
			expect(StringExercise.longestUnique("123")).to be "123".size
		end

		it "returns the number of chars up to the repeat char" do
			expect(StringExercise.longestUnique("12345123")).to be 5
		end
	end

	describe "capCombinations" do
		it "returns [] for nil or empty strings" do 
			expect(StringExercise.capCombinations("")).to match_array []
			expect(StringExercise.capCombinations(nil)).to match_array []
		end

		it "returns 2 elements for one char strings, lower and upper" do
			expect(StringExercise.capCombinations("a")).to match_array ['a', 'A']
		end

		it "ignores non letter characters" do
			expect(StringExercise.capCombinations("a@")).to match_array ['a', 'A']
		end

		it "handles strings of any length" do
			expect(StringExercise.capCombinations("ab")).to match_array %w{ab Ab aB AB}
			expect(StringExercise.capCombinations("abc")).to match_array %w{abc Abc aBc abC ABc AbC aBC ABC}
		end
	end
end
