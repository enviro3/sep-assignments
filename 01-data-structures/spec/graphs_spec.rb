include RSpec

require 'pp'
require_relative '../07-graphs/actor_with_distance'
require_relative '../07-trees/find_kevin_bacon'

RSpec.describe ActorWithDistance, type: Class do
  let(:actors_with_distance) {{
    "Kevin Bacon": ActorWithDistance.new(Kevin_Bacon, [Lori_Singer, John_Lithgow, Dianne_Wiest, Chris_Penn, Sarah_Jessica_Parker]),
    "Lori Singer": ActorWithDistance.new(Lori_Singer, [Kevin_Bacon, John_Lithgow, Dianne_Wiest]),
    "John Lithgow": ActorWithDistance.new(John_Lithgow,[Keven_Bacon, Chris_Penn, Sarah_Jessica_Parker]),
    "Dianne Wiest": ActorWithDistance.new(Dianne_Wiest,[Keven_Bacon, Lori_Singer, Coolbear]),
    "Chris Penn": ActorWithDistance.new(Chris_Penn,[Keven_Bacon, Moofus, John_Lithgow]),
    "Sarah Jessica Parker": ActorWithDistance.new(Sarah_Jessica_Parker,[Keven_Bacon, John_Lithgow]),
    "Moofus": ActorWithDistance.new(Moofus,[Chris_Penn]),
    "Kailey": ActorWithDistance.new(Kailey,[Coolbear]),
    "Coolbear": ActorWithDistance.new(Coolbear,[Kailey, Dianne_Wiest])
   }}

  describe "#initialize" do
    it "instantiates the actors and their related actors" do
      expect(actors_with_distance.actor_name).to_not be_nil
      expect(actors_with_distance.adjacent_actors).to_not be_nil
    end
  end

  describe "#directly_connected_to_kevin?" do
    it "returns the first person in the line" do
      expect(actors_with_distance).to have_value "Kevin_Bacon"
    end
  end

  describe "#find_kevin_bacon" do
    it "returns list of film titles that connect it to Kevin Bacon" do
      expect(line.middle).to eq "Ted"
    end
  end


end
