require 'takeaway'

describe 'Takeaway'  do 

	let(:takeaway) {Takeaway.new}

	context 'Menu' do

		it 'is initialized with a menu of 3 dishes' do
			expect(takeaway.menu.count).to eq 3

		end

		it 'knows there is a dish called Fish' do
			expect(takeaway.menu.has_key?('Fish')).to be true
		end

	end

	context 'Order' do

		it 'can add dishes and quantities to a list' do
			takeaway.order('Chips',2)
			expect(takeaway.list).to eq ['Chips','Chips']
		end

		it 'can calculate the total price' do
			takeaway.order('Fish', 2)
			takeaway.order('Chips',3)
			takeaway.order('Saveloy',2)
			expect(takeaway.bill).to eq 22
		end

	end

	 context 'Checkout' do
	
		it 'checks that the customer has paid correctly' do
			takeaway.order('Fish', 2)
			takeaway.order('Chips',3)
			takeaway.order('Saveloy',2)
			expect{takeaway.checkout(19)}.to raise_error RuntimeError, "The wrong amount was paid. Please try again."
	 	end

	 		it 'sends a  confirmation via sms' do
			takeaway.order('Fish', 2)
			takeaway.order('Chips',3)
			takeaway.order('Saveloy',2)
			takeaway.checkout(22)
			allow(takeaway).to receive(:send_sms)
		end


	end	


end




# Task 2

# Write a class Takeaway.
# Implement the following functionality:
# - list of dishes with prices
# - placing the order by giving the list of dishes, their quantities and a number that should be the exact total. 
# 	If the sum is not correct the method should raise an error, 
# 	otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, 
# 	e.g. "Thank you! Your order was placed and will be delivered before 18:52".
# - The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
# - Use twilio-ruby gem to access the API
# - Use a Gemfile to manage your gems
# - Make sure that your Takeaway class is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send 
# 	texts when your tests are run
# - However, if your Takeaway class is loaded into IRB and the order is placed, the text should actually be sent
# - A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, 
# don't worry about the customer's mobile phone.

# customer places an order 

# Dish
# Responsibility | Collaborator Has a price | Menu Has a name | Menu

# Menu
# Responsibility | Collaborator Has a list of dishes | Menu

# Order
# Responsibility | Collaborator Can have a list of selected dishes | Menu

# Customer Responsibility | Collaborator Can buy food | Menu

# Message Responsibility | Collaborator Send message to customer | Menu