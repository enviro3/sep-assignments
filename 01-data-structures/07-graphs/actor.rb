class Actor
  attr_accessor :actor_name
  attr_accessor :film_actor_hash

  def initialize(actor_name)
    @actor_name = actor_name
    @film_actor_hash = {}
  end
end
