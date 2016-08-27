require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"

#After your tests pass, uncomment this code below
#=========================================================
# # Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!
#
# # Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))
#
# # Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases
def phase_one
	puts "*"*30 + "PHASE 1" + "*"*30
	contestants_eliminated = []
	8.times do
		losing_tribe = @borneo.immunity_challenge
		losing_contestant = losing_tribe.tribal_council
		contestants_eliminated.push losing_contestant.name.capitalize
	end
	puts "HERE'S WHO WAS VOTED OFF: #{contestants_eliminated}\n"

	puts "In the #{@borneo.tribes[0].name} tribe, here's how which members remain: "
	@borneo.tribes[0].members.each{|member| puts member.name}
	puts "In the #{@borneo.tribes[1].name} tribe, here's how which members remain: "
	@borneo.tribes[1].members.each{|member| puts member.name}
	@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
	puts "The name of the merged tribe is #{@merge_tribe}."

	return contestants_eliminated.count
end

def phase_two
	puts "*"*30 + "PHASE 2" + "*"*30
	@jury = Jury.new
	contestants_eliminated = []
	3.times do
		losing_contestant = @merge_tribe.members.delete(@merge_tribe.members.sample).name.capitalize
		puts "#{losing_contestant} has been voted off the #{@merge_tribe} tribe."
		contestants_eliminated.push losing_contestant
	end
	print "HERE'S WHO WAS VOTED OFF: #{contestants_eliminated}\n"
	print "In the #{@merge_tribe} tribe, here's how many members remain: #{@merge_tribe.members.count}."
	return contestants_eliminated.count
end

def phase_three
	puts "*"*30 + "PHASE 3" + "*"*30
	@jury = Jury.new
	7.times do
		losing_contestant = @merge_tribe.members.delete(@merge_tribe.members.sample).name.capitalize
		puts "#{losing_contestant} has been voted off the #{@merge_tribe} tribe."
		@jury.add_member losing_contestant
	end
	print "HERE'S WHO NOW MAKES UP THE JURY: #{@jury.members}\n"
	finalists = @merge_tribe.members
	vote_results = @jury.cast_votes(finalists) #Jury members report votes
	@jury.report_votes(vote_results) #Jury announces their votes
	puts @jury.announce_winner(vote_results) #Jury announces final winner
	return @jury.members.count
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

