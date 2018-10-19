include RSpec

require 'pp'
require_relative '../07-graphs/actor'
require_relative '../07-graphs/find_kevin_bacon'

RSpec.describe 'find paths to kevin bacon' do
  describe "#find paths to kevin bacon" do
    it "returns shortest paths to Kevin Bacon" do
      find_paths_to_kevin_bacon
    end
  end

  describe "construct path from starting actor to kevin" do
    it "#construct_path_from_starting_actor_to_kevin" do
      expect(construct_path_from_starting_actor_to_kevin(Joe)).to eq ["Derptown", "Footloose"]
      expect(construct_path_from_starting_actor_to_kevin(Marcus)).to eq nil
    end
  end


end
