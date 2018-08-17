require_relative 'linked_list'
require 'pp'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
  end

  def []=(key, value) #allows you to assign a value to a key
    perspective_index = index(key,size)
    if @items[perspective_index] == nil
      @items[perspective_index] = LinkedList.new()
    end
    @items[perspective_index].add_to_tail(Node.new(key, value))

    #loadfactor in order to resize 

  end

  #reads the value associated with the key
  def [](key)
    perspective_index = index(key,size)
    if @items[perspective_index] == nil
      return nil
    end
    return @items[perspective_index].find(key).value
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

  # Calculate the current load factor
  #load factor is number of values it stores divided by number of buckets - k
  def load_factor
    pp(@items)
    @items.size
    puts "I AM HERE"
    puts @items.size
    puts "END "

  end

  # Simple method to return the number of items in the hash
  def size
    return @items.length
  end

  # Resize the hash
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
