class ActorWithDistance
  attr_accessor :actor_name
  attr_accessor :distance_from_kevin

  def initialize(actor_name, adjacent_actors)
    @actor_name = actor_name
    @adjacent_actors = adjacent_actors #array, use this to find given actor to Kevin
  end

  def directly_connected_to_kevin?

  end
end
