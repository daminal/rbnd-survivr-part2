


=begin


Phase 1
Survivr is a game in which 20 contestants live on an island in quazi-primitive conditions
and compete in a series of physical and political challenges to avoid elimination. 
The last one left standing will win a million dollars. 

The tribes will now compete in a challenge for immunity from having to vote one of their 
members off the island. After 8 rounds, those remaining will merge into one tribe. 

At the start of this game, these are the contestants on P island.

Tribe X includes:
Tribe Y includes: 

Let the games begin. 

An immunity challenge has taken place and tribe A has won. 
C is voted off the island. Tribe B has spoken. 
<repeat 7 times.>
Phase 1 is complete and a new tribe has formed from the remaining contestants.
The new D tribe includes <contestants>. 

Phase 2 
In this phase, contestants will compete in a challenge for individual immunity. 
A vote will then take place to remove one member from the island. 

Let the challenges begin.
An immunity challenge has taken place and <contestant> has won. 
The tribe has voted <contestant> off the island. <tribe> has spoken.
<repeat twice.> 

Phase 2 is complete and tribe D now has these members:
<contestants>. 

Phase 3
In this phase, the individual immunity challenges will continue, 
but now each member who is voted out of the tribe will stay on <island> island
to form a jury. After 7 rounds, only two contestants will remain. 
The jury will vote to determine who is the winner. 

Let the challenges begin.
An immunity challenge has taken place and <contestant> has won. 
The tribe has voted <contestant> out of the tribe. <tribe> has spoken.
<repeat seven times.> 

The challenges are over and only two are left standing. These are the finalists:
A
B

Who will the jury pick?
These are the jurors: A-G. 

The jury is now voting.

N has voted for O...
repeat 6 times.

The jury has voted.

The totals are: 
A
B

And the winner

is

N

-----------------------


Coming up:
add output to enhance clarity
add comments from rubric
make requirements relative

later:
experiment with (&): contestants = tribes.map(&:members).flatten
refactor cast_votes


=end

	def cast_votes(finalists) 
		votes = {} 
  	finalists.each do |finalist|
    		votes[finalist] = 0 
  	end
  	@members.each do |member| 
  		vote = votes.keys.sample 
  		puts "#{member.to_s} voted for #{vote.to_s}."
  		votes[vote] += 1 
		end
  	return votes
  end


def cast_votes
	finalist[0].to_sym = 0
	finalist[1].to_sym = 0
	@members.each do |member|
		vote = finalists.sample
		puts "#{member.name} voted for #{vote}"
		vote.to_sym +=1
	end
end

	def cast_votes(finalists)
		votes = {"#{finalists[0]}" => 0, "#{finalists[1]}" => 0}
		@members.each do |member|
			vote = finalists.sample
			puts "#{member.name.capitalize} voted for #{vote}"
			votes[vote.to_s] +=1
		end
		return votes
	end

irb -r './survivr.rb'
phase_one
phase_two
phase_three

from phase_one:
	puts "In the #{@borneo.tribes.first.name.capitalize} tribe, these members remain: "
	@borneo.tribes.first.members.each{|member| puts member.name}
	puts "In the #{@borneo.tribes.last.name.capitalize} tribe, here's how which members remain: "
	@borneo.tribes.last.members.each{|member| puts member.name}
	@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
	@borneo.clear_tribes
	puts "The name of the merged tribe is #{@merge_tribe}."
