require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"
require 'colorizr'
require 'artii'

# Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!
#
# Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))
#
# Create a new game of Survivor. The assignment requires the game to be able to be called 
# as '@borneo'.
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================

def print_art(message)
	a = Artii::Base.new
	puts a.asciify(message).pink
end
def print_losers(losers)
	losers.each {|loser| puts "#{loser.name.capitalize} has been voted out."}
end
#performs n eliminations, holding immune either 'individual' or 'tribe'.
def eliminate(n, immunity)
	losers = []
	n.times do
		losers.push @borneo.immunity_challenge.tribal_council if immunity == 'tribe'
		losers.push @merge_tribe.tribal_council if immunity == 'individual'
	end
	print_losers(losers)
	losers
end
def phase_one
	print_art('Phase 1')
	losers = eliminate(8, 'tribe')
	@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
	@borneo.clear_tribes
	puts "The name of the merged tribe is #{@merge_tribe}."
	return losers.count
end

def phase_two
	print_art('Phase 2')	
	eliminate(3, 'individual').count
end

def phase_three
	print_art('Phase 3')
	@jury = Jury.new
	# 7.times do
	# 	loser = @merge_tribe.tribal_council
	# 	puts "#{loser.name.capitalize} has been voted off the #{@merge_tribe} tribe."
	# 	@jury.add_member loser
	# end
	eliminate(7, 'individual').each{|mem| @jury.add_member(mem)}
	finalists = @merge_tribe.members
	vote_results = @jury.cast_votes(finalists) #Jury members report votes
	@jury.report_votes(vote_results) #Jury announces their votes
	puts "Overall winner and sole survivor is .........................."
	puts @jury.announce_winner(vote_results).name.capitalize + "!"
	return @jury.members.count
end

def run
phase_one
phase_two
phase_three
end



# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
# phase_one #8 eliminations
# @merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
# phase_two #3 more eliminations
# @jury = Jury.new
# phase_three #7 elminiations become jury members
# finalists = @merge_tribe.members #set finalists
# vote_results = @jury.cast_votes(finalists) #Jury members report votes
# @jury.report_votes(vote_results) #Jury announces their votes
# @jury.announce_winner(vote_results) #Jury announces final winner

