require_relative 'min_heap'
require_relative 'actors_with_distance'

Kevin_Bacon =  "Kevin Bacon"
Lori_Singer = "Lori Singer"
John_Lithgow = "John Lithgow"
Dianne_Wiest = "Dianne Wiest"
Chris_Penn = "Chris Penn"
Sarah_Jessica_Parker = "Sarah Jessica Parker"
Moofus = "Moofus"
Kailey = "Kailey"
Coolbear = "Coolbear"

#actors_with_distance.adjacent_actors
#when get adjacent actors, want that instance (use that actor to find other actor with distance, chaining)

#actual way to represent graph, nodes and their connection to other nodes
actors_with_distance = {
  "Kevin Bacon": ActorWithDistance.new(Kevin_Bacon, [Lori_Singer, John_Lithgow, Dianne_Wiest, Chris_Penn, Sarah_Jessica_Parker]),
  "Lori Singer": ActorWithDistance.new(Lori_Singer, [Kevin_Bacon, John_Lithgow, Dianne_Wiest]),
  "John Lithgow": ActorWithDistance.new(John_Lithgow,[Keven_Bacon, Chris_Penn, Sarah_Jessica_Parker]),
  "Dianne Wiest": ActorWithDistance.new(Dianne_Wiest,[Keven_Bacon, Lori_Singer, Coolbear]),
  "Chris Penn": ActorWithDistance.new(Chris_Penn,[Keven_Bacon, Moofus, John_Lithgow]),
  "Sarah Jessica Parker": ActorWithDistance.new(Sarah_Jessica_Parker,[Keven_Bacon, John_Lithgow]),
  "Moofus": ActorWithDistance.new(Moofus,[Chris_Penn]),
  "Kailey": ActorWithDistance.new(Kailey,[Coolbear]),
  "Coolbear": ActorWithDistance.new(Coolbear,[Kailey, Dianne_Wiest])
 }


visited = [] #use in recursion to not repeat, having seperate visted arrays for each path in recursive method, tracking distance
#check actor, their adjacent actors, trail until find nodes that reference Kevin Bacon, return path count
#returns an Array of at most six film titles that connect it to the Kevin_Bacon Node
def find_kevin_bacon(starting_node) #Breath first search, check layer by layer
  #look for kevin bacon in starting node, is directly connected or is kevin bacon?
  start_node.directly_connected_to_kevin?()

  @actors_with_distance.each do |actor|
    actor[0..actor.length]include?(Kevin_Bacon)
  end


  #loop through every adjacent node, then use beginning name in the array and look through their actors with distance

  #find distance with jumps? person to person, returning distance (integer) recursive alg for counter

end
