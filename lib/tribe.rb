class Tribe
	attr_reader :name, :members

	def initialize(options = {})
		@name = options[:name]
		@members = options[:members]
		puts "Tribe #{@name} has been created"
	end
	def to_s
		@name
	end
	def tribal_council(options = {})
		eliminated = @members.select{|mem| mem != options[:immune]}.sample
		members_remaining = @members.delete(eliminated) 
	end
end


=begin

I have to find a way to select the member that has the name of the immune person. 
It looks like members is an array of innumerables. So I need to go into that method
to get this test to pass on a function that actually keeps an immune person immune, I think. 

So, I need to find the innumerable that contains the string. 
Go into the innumerable. If innumerable contains it, return the innumerable. 


=end	
