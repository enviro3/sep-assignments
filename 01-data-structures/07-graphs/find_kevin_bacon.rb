require_relative 'actor'
require 'pp'


#Films, actors in those films, create list of films, and actors in those films, for every actor add their film to film_actor_hash
Kevin_Bacon = Actor.new("Kevin Bacon")
Lori_Singer = Actor.new("Lori Singer")
John_Lithgow = Actor.new("John Lithgow")
Joe = Actor.new("Joe")
Tom = Actor.new("Tom")
Marcus = Actor.new("Marcus")


footloose = [Kevin_Bacon, Lori_Singer, John_Lithgow]

footloose.each do |actor|
  actor.film_actor_hash['Footloose'] = footloose.select {|other_actor| actor != other_actor}

end

derptown = [Joe, Lori_Singer]
derptown.each do |actor|
  actor.film_actor_hash['Derptown'] = derptown.select {|other_actor| actor != other_actor}
end

blrp = [Joe, Tom]
blrp.each do |actor|
  actor.film_actor_hash['Blrp'] = blrp.select {|other_actor| actor != other_actor}
end

def find_paths_to_kevin_bacon
  visited = []
  unvisited = [Kevin_Bacon]
  shortest_distance_from_kevin_by_actor = {}
  shortest_distance_from_kevin_by_actor[Kevin_Bacon] = 0
  previous_actor_lookup_hash = {}

  while unvisited.empty? === false
    actor_to_visit_now = unvisited.shift
    if visited.include?(actor_to_visit_now)
      next
    end
    visited.push(actor_to_visit_now)
    actor_to_visit_now.film_actor_hash.each_value do |actor_list|
      actor_list.each do |actor|
        unvisited.push(actor)
        if shortest_distance_from_kevin_by_actor.include?(actor)
          next
        end
        shortest_distance_from_kevin_by_actor[actor] =
          shortest_distance_from_kevin_by_actor[actor_to_visit_now] + 1
        previous_actor_lookup_hash[actor] = actor_to_visit_now
      end
    end
  end

  puts 'shortest_distance_from_kevin_by_actor:'
  shortest_distance_from_kevin_by_actor.each_key do |actor|
    puts actor.actor_name + ' ' + shortest_distance_from_kevin_by_actor[actor].to_s
  end
  puts 'previous_actor_lookup_hash:'
  previous_actor_lookup_hash.each_key do |actor|
    puts actor.actor_name + ' ' + previous_actor_lookup_hash[actor].actor_name
  end
  #future discussion with Mark
  return previous_actor_lookup_hash
end
# Use previous_actor_lookup_hash to determine the distance and path and return it

def construct_path_from_starting_actor_to_kevin(starting_actor)
  previous_actor_lookup_hash = find_paths_to_kevin_bacon()

  current_actor = starting_actor
  array_of_films = []
  while current_actor != Kevin_Bacon
    next_current_actor = previous_actor_lookup_hash[current_actor]
    if next_current_actor === nil
      return nil
    end
    films_shared_with_next_actor =
      current_actor.film_actor_hash.select {|film_name, actor_list| actor_list.include?(next_current_actor)}
    array_of_films.push(films_shared_with_next_actor.first[0])
    current_actor = next_current_actor
  end
  return array_of_films
end
