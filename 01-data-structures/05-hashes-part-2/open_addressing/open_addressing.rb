require_relative 'node'

class OpenAddressing
  def initialize(size)
     @items = Array.new(size)
  end

  def []=(key, value)
    there_is_a_collision = @items[index(key, size)] != nil && @items[index(key,@items.length)].key != key

    #When a collision occurs, search for the next available location
    while there_is_a_collision
      #loop through array to find an index that is nil

      #next_open_index

      # there_is_a_collision = @items[index(key, size)] != nil
    end
    # @items[index(key,@items.length)] = HashItem.new(key, value)

  end
  end

  def [](key)
    @items[index(key,@items.length)].value
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
    @items.each do |i|
      if i == nil
        @items[index(i.key,@items.length)] = HashItem.new(i.key, i.value)
      end
    end
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
        @items[index(i.key,@items.length)] = HashItem.new(i.key, i.value)
      end
    end
  end
