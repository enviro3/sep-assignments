include RSpec

require 'pp'
require_relative '../07-graphs/actor_with_distance'
require_relative '../07-graphs/find_kevin_bacon'

RSpec.describe ActorWithDistance, type: Class do
  let(:find_kevin_bacon) {{}}

  describe "#initialize" do
    it "instantiates the actors and their related actors" do
      expect(actors_with_distance.actor_name).to_not be_nil
      expect(actors_with_distance.adjacent_actors).to_not be_nil
    end
  end

  describe "#directly_connected_to_kevin?" do
    it "directly connect to Kevin Bacon" do
      expect(actors_with_distance).to have_value "Kevin_Bacon"
    end
  end

  describe "#find_kevin_bacon" do
    it "returns list of film titles that connect starting node to Kevin Bacon" do
      # example to be updated: expect(line.middle).to eq "Ted"
    end
  end


end
