class Game
	attr_reader :tribes
	#Thanks to udacity reviewer for improvement on initialize.
	#It used to read, @tribes = tribes. This produced @tribes = Class when only 1 tribe was passed.
	def initialize *tribes
		@tribes = ([] << tribes).flatten!
	end
	def add_tribe(tribe)
		@tribes << tribe
	end
	#Returns the loser of the immunity challenge.
	def immunity_challenge
		@tribes.sample
	end
	def clear_tribes
		@tribes.clear
	end
		def merge(new_name)
		contestants = @tribes[0].members + @tribes[1].members
		clear_tribes
		add_tribe(Tribe.new({name: new_name, members:contestants}))
		return @tribes.first
	end
 #  def merge(new_name)
	# #solution from: https://discussions.udacity.com/t/trouble-with-merge-in-game-class/164225
 #    contestants = @tribes.map(&:members).flatten
 #    clear_tribes
 #    Tribe.new(name: new_name, members: contestants)
	# end
	def individual_immunity_challenge
		@tribes[0].members.sample		
	end
end