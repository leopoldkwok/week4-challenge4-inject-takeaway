class Array

	def leo_inject(beginvalue = nil)
		copy = self.dup
	 	memory = beginvalue || copy.slice!(0)
	 	copy.each do |value|
	 		memory = yield(memory, value)
	 	end
	 	memory
	end
end


# arr = [1,2,3,4]

# p arr.leo_inject {|mem, item| mem + item}

# p arr

# def run_this
#  yield "hi"
# end

# run_this {|hello| p hello}


# def run_thiz(&block)
#  block.call
# end
# run_thiz {p "hi"}


