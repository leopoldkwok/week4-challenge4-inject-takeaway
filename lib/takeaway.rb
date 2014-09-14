require_relative 'send_sms.rb'

class Takeaway

	attr_accessor :menu , :bill

	include Sms
	
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

	def checkout(customer_input)
		if customer_input !=@bill
			raise RuntimeError, "The wrong amount was paid. Please try again."
		else
			confirm_order
		end
	end		

	def confirm_order
		puts "Order Confirmation. Thanks for your order"
		send_sms
	end


end

