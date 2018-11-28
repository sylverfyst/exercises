class NumberExercise < ApplicationRecord
	def self.BinaryGap(n)
		return nil if n <= 0 || n >= 2147483648 
		binary = n.to_s(2)
		gap = 0
		binary.scan(/(?<=1)0+(?=1)/) { |match| match.size > gap ? gap = match.size : gap }
		return gap
	end
end
