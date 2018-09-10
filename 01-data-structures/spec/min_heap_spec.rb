include RSpec

require 'pp'
require_relative '../06-trees/min_heap/min_heap'
require_relative '../06-trees/min_heap/movie_rating'

RSpec.describe MinHeap, type: Class do
  let (:matrix) { MovieRating.new("The Matrix", 87) }

  let (:my_heap) { MinHeap.new(matrix) }
  let (:pacific_rim) { MovieRating.new("Pacific Rim", 72) }
  let (:braveheart) { MovieRating.new("Braveheart", 78) }
  let (:jedi) { MovieRating.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { MovieRating.new("Donnie Darko", 85) }
  let (:inception) { MovieRating.new("Inception", 86) }
  let (:district) { MovieRating.new("District 9", 90) }
  let (:shawshank) { MovieRating.new("The Shawshank Redemption", 91) }
  let (:martian) { MovieRating.new("The Martian", 92) }
  let (:hope) { MovieRating.new("Star Wars: A New Hope", 93) }
  let (:empire) { MovieRating.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { MovieRating.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "properly inserts a new MovieRating as a left child" do
      my_heap.insert(district)
      expect(my_heap.heap[1].title).to eq district.title
      expect(my_heap.heap[0].title).to eq matrix.title
    end

    it "properly inserts a second MovieRating as a right child" do
      my_heap.insert(district)
      my_heap.insert(shawshank)
      expect(my_heap.heap[0].title).to eq matrix.title
      expect(my_heap.heap[1].title).to eq district.title
      expect(my_heap.heap[2].title).to eq shawshank.title
    end

    it "properly inserts a new minimum" do
      my_heap.insert(district)
      my_heap.insert(shawshank)
      my_heap.insert(pacific_rim)
      expect(my_heap.heap[3].title).to eq district.title
      expect(my_heap.heap[1].title).to eq matrix.title
      expect(my_heap.heap[2].title).to eq shawshank.title
      expect(my_heap.heap[0].title).to eq pacific_rim.title
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      my_heap.insert(empire)
      my_heap.insert(mad_max_2)
      expect(my_heap.find(nil)).to eq nil
    end

    it "handles lookups for stuff that isn't in the heap" do
      my_heap.insert(empire)
      my_heap.insert(mad_max_2)
      expect(my_heap.find(shawshank)).to eq nil
    end

    it "properly finds a new MovieRating as a left child" do
      my_heap.insert(district)
      expect(my_heap.heap.find(district.title)).to_not be_nil
      expect(my_heap.heap.find(matrix.title)).to_not be_nil
    end

    it "properly finds a second MovieRating as a right child" do
      my_heap.insert(district)
      my_heap.insert(shawshank)
      expect(my_heap.heap.find(matrix.title)).to_not be_nil
      expect(my_heap.heap.find(district.title)).to_not be_nil
      expect(my_heap.heap.find(shawshank.title)).to_not be_nil
    end

    it "properly finds a new minimum" do
      my_heap.insert(district)
      my_heap.insert(shawshank)
      my_heap.insert(pacific_rim)
      expect(my_heap.heap.find(district.title)).to_not be_nil
      expect(my_heap.heap.find(matrix.title)).to_not be_nil
      expect(my_heap.heap.find(shawshank.title)).to_not be_nil
      expect(my_heap.heap.find(pacific_rim.title)).to_not be_nil
    end
  end

  describe "#delete(data)" do
    it "deletes minimum MovieRating" do
      my_heap.insert(district)
      my_heap.insert(shawshank)
      my_heap.insert(pacific_rim)
      my_heap.delete_minimum()
      expect(my_heap.heap[0].title).to eq matrix.title
      expect(my_heap.heap[1].title).to eq district.title
      expect(my_heap.heap[2].title).to eq shawshank.title
      expect(my_heap.heap.length).to eq 3

      my_heap.delete_minimum()
      expect(my_heap.heap[0].title).to eq district.title
      expect(my_heap.heap[1].title).to eq shawshank.title

      my_heap.delete_minimum()
      expect(my_heap.heap[0].title).to eq shawshank.title

      my_heap.delete_minimum()
      expect(my_heap.heap.size).to eq 0
    end

  end

  describe "#print(root)" do
     specify {
       expected_output = "Pacific Rim: 72\nThe Matrix: 87\nDistrict 9: 90\nThe Shawshank Redemption: 91\n"
       my_heap.insert(district)
       my_heap.insert(shawshank)
       my_heap.insert(pacific_rim)
       expect { my_heap.print() }.to output(expected_output).to_stdout
     }
  end
end
