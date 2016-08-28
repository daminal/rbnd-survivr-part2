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
# Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================

def print_art(message)
	a = Artii::Base.new
	puts a.asciify(message).pink
end
def phase_one
	print_art('Phase 1')
	contestants_eliminated = []
	8.times do
		losing_tribe = @borneo.immunity_challenge
		losing_contestant = losing_tribe.tribal_council
		contestants_eliminated.push losing_contestant.name.capitalize
	end
	@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
	@borneo.clear_tribes
	puts "The name of the merged tribe is #{@merge_tribe}."
	return contestants_eliminated.count
end

def phase_two
	print_art('Phase 2')	
	@jury = Jury.new
	contestants_eliminated = []
	3.times do
		losing_contestant = @merge_tribe.members.delete(@merge_tribe.members.sample).name.capitalize
		puts "#{losing_contestant} has been voted off the #{@merge_tribe} tribe."
		contestants_eliminated.push losing_contestant
	end
	return contestants_eliminated.count
end

def phase_three
	print_art('Phase 3')
	@jury = Jury.new
	7.times do
		loser = @merge_tribe.members.delete(@merge_tribe.members.sample)
		puts "#{loser.name.capitalize} has been voted off the #{@merge_tribe} tribe."
		@jury.add_member loser
	end
	finalists = @merge_tribe.members
	p finalists
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

