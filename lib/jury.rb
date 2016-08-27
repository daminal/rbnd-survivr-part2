class Jury
	attr_accessor :members
	
	def initialize
		@members = []
	end
	def add_member(member)
		@members  << member
	end
	def cast_votes(finalists) 
		puts "*"*200
		puts finalists
		votes = {}
  	finalists.each do |finalist|
    		votes[finalist] = 0 
  	end
  	puts votes
  	@members.each do |member| 
  		vote = votes.keys.sample 
  		puts "#{member.to_s} voted for #{vote.to_s}."
  		votes[vote] += 1
		end
		puts votes
  	return votes
  end
	def report_votes(final_votes)
		final_votes.each{|finalist, votes| puts "#{finalist}: #{votes}"}
	end
	def announce_winner(final_votes)
		finalists = final_votes.keys
		winner = (final_votes[finalists[0]]>final_votes[finalists[1]]) ? finalists[0] : finalists[1]
	end
end
