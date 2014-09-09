class Takeaway

	attr_accessor :menu , :bill
	
	def initialize
		@menu =
				{"Fish"		=>	5,
				 "Chips"	=>	2,
				 "Saveloy"	=>	3
				}
		
		@bill = 0
	end

	def order(dish, quantity)
		quantity.times { list << dish}
		sum = list.map {|dish| menu[dish]}
		@bill = sum.inject{ |memo, price| memo + price}
	end

	def list
		@list ||= []
	end

end

