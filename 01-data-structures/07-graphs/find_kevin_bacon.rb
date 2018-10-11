require_relative 'actor'



#actors_with_distance.adjacent_actors
#when get adjacent actors, want that instance (use that actor to find other actor with distance, chaining)

#actual way to represent graph, nodes and their connection to other nodes
# film_hash["Footloose"] = [kevin_bacon, lori_singer, john_lithgow, dianne_west, chris_penn, sara_jessica_parker]
# film_hash["Interstellar"] = [john_lithgow, matthew_mcconaughey]


#Films, actors in those films, create list of films, and actors in those films, for every actor add their film to film_actor_hash
Kevin_Bacon = Actor.new("Kevin Bacon")
Lori_Singer = Actor.new("Lori Singer")
John_Lithgow = Actor.new("John_Lithgow")

footloose = [Kevin_Bacon, Lori_Singer, John_Lithgow]

footloose.each |actor| do
  actor.film_actor_hash['Footloose'] = footloose.select {|other_actor| actor != other_actor}
end

visited = [] #use in recursion to not repeat, having seperate visted arrays for each path in recursive method, tracking distance
#check actor, their adjacent actors, trail until find nodes that reference Kevin Bacon, return path count
#returns an Array of at most six film titles that connect it to the Kevin_Bacon Node
def find_kevin_bacon(starting_actor) #Breath first search, check layer by layer
  @actors_with_distance.each do |actor|
    actor[0..actor.length].include?(Kevin_Bacon)
  end


  #loop through every adjacent node, then use beginning name in the array and look through their actors with distance

  #find distance with jumps? person to person, returning distance (integer) recursive alg for counter
  return find_kevin_bacon_helper(starting_actor, [], 0)
end


def find_kevin_bacon_helper(current_actor, visited, distance)
  if current_actor == Kevin_Bacon
    return visited
  end
  if distance > 6
    return nil
  end
  current_actor.film_actor_hash.each do |film_name, actor_list|
    actor_list.each do |other_actor|
      visited.push(other_actor)
      recursive_answer = find_kevin_bacon_helper(other_actor, visited, distance + 1)
      if recursive_answer != nil
        return recursive_answer
      end
      visited.pop()
    end
  end
  return nil
end

# return find_kevin_bacon_helper(some_other_actor, visited)

# 1. Always make a helper - it will never hurt, and it might help.
# 2. The non-helper contains lines of code that should only execute once (stuff that wouldn't be in the loop for the iterative version). The last line of the non-helper should be "return helper(the,original,arguments)"
# 3. The helper contains lines of code that should execute more than once. Aka anything that in the iterative solution would be in the loop, which includes the if statement that replaces the condition of the while loop.
# 4. Leave any existing return statements alone.
# 5. Add new return statements anywhere where you need to "keep going", anywhere where in the iterative solution, the next thing that would happen would be you going to the top of the loop. These new return statements should be recursive calls to the helper function, "return helper(the,original,args,AND,anything,that,changes).
