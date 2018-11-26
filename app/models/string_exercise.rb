class StringExercise < ApplicationRecord
	
	#implement an method to determine if a string has all unique characters.
	def self.allUnique?(string)
		# The string is automatically has only unique chars if there's one or less characters
		return true if string.size <= 1
		# the string only has unique characters if the size is equal when using the "uniq" method
		return string.split('').uniq.size == string.split('').size
		false
	end


	# Given two strings decide if one is a permutation of the other
	#   Use the general match definition of permutation, so if A = [1,2,3]
	#	the permutations of A are [], [1], [2], [3], [1,2], [1,3], [2,3], [1,2,3]
	#   if B is longer than A, it's automatically not a permutation since duplications are still counted
	def self.is_perm?(a, b)
		# if b is empty or nil (nil counts as the empty set in this case) return true 
		# this needs to be first because b being nil will otherwise cause errors
		return true if b.nil? || b.size == 0
		#if b is longer than a automatically disqualify it
		return false if b.size > a.size 
		
		a_chars = a.split "" 
		b_chars = b.split "" 

		b_chars.each do |char|
			#if there's a character in the b string that isn't in the a string the whole thing can't be a permutation
			if ! a_chars.include?(char)
				return false
			end
		end
		return true
	end

	# Write a method to identify the longest unique substring in a string, 
	# where a unique substring only has one of each char, returns size
	def self.longestUnique(string)
		# the longest substring size is 0 if the string's empty or nil
		return 0 if string == "" || string == nil
		# the substring can only be size one if the string's either sized one itself
		return 1 if string.size == 1 
		
		set = Set.new
		longest_substring = 0
		current_substring = 0

		for i in 0...string.size do
			if set.include?(string[i])
				current_substring = 0
				set.clear
			end

			current_substring += 1
			set.add(string[i])

			if current_substring > longest_substring
				longest_substring = current_substring
			end
		end
		return longest_substring
	end

	# Given an arbitrary string generate all the string combinations of upper 
	# and lowercase leters from the original string.
	# Example output capCombinations("ab"): ['ab', 'aB', 'Ab', 'AB']

	def self.capCombinations(string)
		return [] if string.nil? || string == ""

		result = ['']
		
		string.each_char do |char|
			#ignore if char is not a letter
			if char[/[a-zA-Z]+/] != char
				next
			end
		
			substring = result.clone
			result = []
			
			substring.each do |c|
				result << c + char.upcase
				result << c + char.downcase
			end
		end

		return result
	end
end
