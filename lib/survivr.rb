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
		puts @borneo.immunity_challenge.class
	n.times do
	puts '*'*200
		losers.push @borneo.immunity_challenge.tribal_council if immunity == 'tribe'
		losers.push @merge_tribe.tribal_council if immunity == 'individual'
	end
	print_losers(losers)
	losers
end
def phase_one
	print_art('Phase 1')
  8.times do
    loser_index = @borneo.tribes.find_index(@borneo.immunity_challenge)
    loser = @borneo.tribes[loser_index].tribal_council()
  end
end

def phase_two
	print_art('Phase 2')	
  3.times do
    immune = @borneo.individual_immunity_challenge
    @merge_tribe.tribal_council(immune: immune)
  end
end

def phase_three
	print_art('Phase 3')	
  7.times do
    immune = @borneo.individual_immunity_challenge
    loser = @merge_tribe.tribal_council(immune: immune)
    @jury.add_member(loser)
  end
end

# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
phase_one #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
@jury = Jury.new
phase_three #7 elminiations become jury members
finalists = @merge_tribe.members #set finalists
vote_results = @jury.cast_votes(finalists) #Jury members report votes
@jury.report_votes(vote_results) #Jury announces their votes
@jury.announce_winner(vote_results) #Jury announces final winner

