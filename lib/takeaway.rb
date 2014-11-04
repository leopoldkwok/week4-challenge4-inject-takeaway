require 'twilio-ruby'

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

	def checkout(customer_input)	
		raise  "The wrong amount was paid. Please try again." if customer_input != @bill
		confirm_order
	end		

	def confirm_order
		puts "Order Confirmation. Thanks for your order"
		send_sms
	end

	def time
		time_plus_one_hour = Time.now + 1*60*60
		time_plus_one_hour.strftime('%H:%M') 
	end

	def send_sms
		# my twilio credentials
		account_sid	= 'ACc5d1fbaaa18454336e23c154c20fa2c3' 
		auth_token	= '89465313f553c3771791b18c015b5611'
	 
		# set up a client to talk to the Twilio REST API 
		@client = Twilio::REST::Client.new account_sid, auth_token 
		@client.account.messages.create({
				# this number has been provided by twilio
				:from => '+44 1554 260042',
				# this is an enabled number of my choice
				:to => '07789995094',
				:body => "Thank you! Your order was placed successfully and will be delivered at #{time}",  
			})
	end



end

