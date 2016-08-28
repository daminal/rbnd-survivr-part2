class Tribe
	require 'colorizr'
	attr_reader :name, :members

	def initialize(options = {})
		@name = options[:name]
		@members = options[:members]
		puts "Tribe #{@name.light_blue} has been created"
	end
	def to_s
		@name.light_blue
	end
	def tribal_council(options = {})
		@members.delete(@members.reject{|mem| mem == options[:immune]}.sample)
	end
end