require_relative 'linked_list'
require 'pp'

class SeparateChaining
  attr_reader :max_load_factor
  attr_reader :items

  def initialize(size)
    @max_load_factor = 0.7
    @item_count = 0
    @items = Array.new(size)
  end

  def []=(key, value) #allows you to assign a value to a key
    prospective_index = index(key,size)
    if @items[prospective_index] == nil
      @items[prospective_index] = LinkedList.new()
    end
    node = @items[prospective_index].find(key)
    if node == nil
      @items[prospective_index].add_to_tail(Node.new(key, value))
      @item_count += 1
    else
      node.value = value
    end
    if load_factor >= @max_load_factor
      resize
    end
  end

  #reads the value associated with the key
  def [](key)
    prospective_index = index(key,size)
    if @items[prospective_index] == nil
      return nil
    end
    return @items[prospective_index].find(key).value
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
    if @item_count == 0
      return 0
    end
    @item_count.to_f/@items.length.to_f
  end

  # Simple method to return the number of items in the hash
  def size
    return @items.length
  end

  # Resize the hash
  def resize
    old_items = @items
    @items = Array.new(@items.size*2)
    @item_count = 0
    old_items.each do |linked_list|
      if linked_list != nil
        current_node = linked_list.head
        while current_node != nil
          self[current_node.key] = current_node.value
          current_node = current_node.next
        end
      end
    end
  end
end
