class Tribe
	require 'colorizr'
	attr_reader :name, :members

	def initialize(options = {})
		@name = options[:name]
		@members = options[:members]
		puts "Tribe #{@name.light_blue} has been created"
	end
	#this function would return @name.light_blue to colorize tribe but tribe_test.rb prohibits it.
	def to_s
		@name
	end
	def tribal_council(options = {})
		@members.delete(@members.reject{|mem| mem == options[:immune]}.sample)
	end
end