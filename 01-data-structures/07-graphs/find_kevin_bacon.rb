require_relative 'min_heap'
require_relative ''

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
actors_with_distance = {Kevin_Bacon: ActorWithDistance.new(Kevin_Bacon, [Lori_Singer, John_Lithgow, Dianne_Wiest, Chris_Penn, Sarah_Jessica_Parker]), }

adjacencyList = { #actors with distance

  Keven_Bacon: [Lori_Singer, John_Lithgow, Dianne_Wiest, Chris_Penn, Sarah_Jessica_Parker],
  Lori_Singer: [Kevin_Bacon, John_Lithgow, Dianne_Wiest],
  John_Lithgow: [Keven_Bacon, Chris_Penn, Sarah_Jessica_Parker],
  Dianne_Wiest: [Keven_Bacon, Lori_Singer, Coolbear],
  Chris_Penn: [Keven_Bacon, Moofus, John_Lithgow],
  Sarah_Jessica_Parker: [Keven_Bacon, John_Lithgow],
  Moofus: [Chris_Penn],
  Kailey: [Coolbear],
  Coolbear: [Kailey, Dianne_Wiest]
}

visited = []
#check actor, their adjacent actors, trail until find nodes that reference Kevin Bacon, return path count
#returns an Array of at most six film titles that connect it to the Kevin_Bacon Node
def find_kevin_bacon(starting_node)
  # Find the Baconator
  my_heap = Heap.new(Kevin_Bacon)
  Best_Came_From = {'A': nil}

end
