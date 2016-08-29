class Jury	
	attr_accessor :members
	
	def initialize
		@members = []
	end
	def add_member(member)
		@members  << member
	end
	def cast_votes(finalists) 
		votes = {}
  	finalists.each do |finalist|
    		votes[finalist] = 0 
  	end
  	@members.each do |member| 
  		finalist = votes.keys.sample 
  		puts "#{member.to_s.capitalize} voted for #{finalist.to_s.capitalize}."
  		votes[finalist] += 1
		end
  	return votes
  end
	def report_votes(final_votes)
		final_votes.each{|finalist, votes| puts "#{finalist}: #{votes}"}
	end
	#Thanks to udacity coach for improvement in the second line in announce_winner.
	def announce_winner(final_votes)
		finalists = final_votes.keys
		winner = final_votes.max_by{|finalist, votes| votes}.first
	end
end
