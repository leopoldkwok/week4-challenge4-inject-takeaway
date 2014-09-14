class Array

	def leo_inject(beginvalue = nil)
	 	memory = beginvalue || self.slice!(0)
	 	self.each do |value|
	 		memory = yield(memory, value)
	 	end
	 	memory
	end
end