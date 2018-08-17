require_relative 'node'

class OpenAddressing
  def initialize(size)
     @items = Array.new(size)
  end

  # rubyHash = {}
  # rubyHash["foo"] = 5

  # myHash = OpenAddressing.new(3)
  # myHash["foo"] = 5
  # Case 1. We look it up at expected index, we find nothing, we put it in
  # Case 2. We look it up at expected index, we find that very key, replace the value
  # Case 3. We look it up at expected index, we find a different key, collision,
  #   We look up the next open index,
  #   if we found one (aka it is not -1 aka @items is fulllllllll), put it in
  #   else resize and repeat starting at case 1, skipping case 2 next time (though it won't hurt if you don't)
  def []=(key, value)
    prospective_index = index(key,size)
    there_is_a_collision = @items[prospective_index] != nil && @items[prospective_index].key != key
    #When a collision occurs, search for the next available location
    while there_is_a_collision
      prospective_index = next_open_index(prospective_index)
      #if equals -1, then resize
      if prospective_index == -1
        resize
        prospective_index = index(key,size)
        prospective_index = next_open_index(prospective_index)
      end
      there_is_a_collision = @items[prospective_index] != nil
    end
    @items[prospective_index] = Node.new(key, value)
  end

  def [](key)
    for i in index(key,size)...size
      if @items[i] == nil
        return nil
      elsif @items[i].key == key
        return @items[i].value
      end
    end
    for i in 0...index(key,size) do
      if @items[i] == nil
        return nil
      elsif @items[i].key == key
        return @items[i].value
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key_array = []
    key.each_byte {|c| key_array << c }
    total = 0
    key_array.each do |i|
    	total += i
    end
    return total % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    #loop through array to find an index that is nil
    for i in index...@items.length do
      if @items[i] == nil
        return i
      end
    end
    for i in 0...index do
      if @items[i] == nil
        return i
      end
    end
    return -1
  end

  # Simple method to return the number of items in the hash
  def size
    return @items.length
  end

  # Resize the hash
  # Resizes using doubling
  def resize
    old_items = @items
    @items = Array.new(@items.size*2)
    old_items.each do |i|
      if i != nil
        puts i
        @items[index(i.key,@items.length)] = Node.new(i.key, i.value)
      end
    end
  end
end
