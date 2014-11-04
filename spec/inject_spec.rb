# Task 1
	# Reopen the Array class or subclass it.
	# Rewrite the inject method. 
	# Write a test for it first. Don't worry about returning an enumerator, assume a block is always given
	# Name your method differently (that is, not inject() or subclass Array) because rspec uses inject() internally, 
	# so the tests will fail with weird messages unless your implementation of inject is perfect.


require 'inject'

describe Array do

	context 'testing existing inject' do

		it 'subtracts all the numbers within the array' do
			array = [1,2,3,4]
			existing_inject = array.inject{|sum, n|sum - n}
			expect(existing_inject).to eq -8
		end

		it 'adds up all the numbers within this array' do
			array = [1,2,3,4,5]
			existing_inject = array.inject{|sum, n|sum + n}
			expect(existing_inject).to eq 15
		end

		it 'multiplies up all the numbers within this array' do
			array = [1,2,3,6]
			existing_inject = array.inject{|sum, n|sum * n}
			expect(existing_inject).to eq 36
		end

	end

	context 'Leo inject method' do

		it 'adds up like the existing inject' do 
			array = [1,2,3,4]
			my_inject = array.leo_inject{|sum,n|sum + n}
			expect(my_inject).to eq 10
		end

		it 'subtracts like the existing inject' do
			array = [1,2,3,4]
			my_inject = array.leo_inject{|sum, n|sum - n}
			expect(my_inject).to eq -8
		end

		it 'multiplies like the exisiting inject' do
			array = [1,2,3,4]
			my_inject = array.leo_inject {|sum, n| sum * n}
			expect(my_inject).to eq 24
		end

		it ' should be able to have a starting value' do
			array = [1,2,3,4]
			my_inject = array.leo_inject(5) {|sum, n| sum + n}
			expect(my_inject).to eq 15
		end


	end

	
end