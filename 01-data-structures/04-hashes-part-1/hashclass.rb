class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  # myHash[key] = value
  # myHash.[]=(key, value)

  def []=(key, value)
    there_is_a_collision = @items[index(key, size)] != nil && @items[index(key,@items.length)].key != key 

    #When a collision occurs, expand the size of the hash by doubling its existing size.
    while there_is_a_collision
      resize
      there_is_a_collision = @items[index(key, size)] != nil
    end
    @items[index(key,@items.length)] = HashItem.new(key, value)

  end

  # puts myHash[key]; when this is called, you are calling def [](key)
  # puts myHash.[](key)
  def [](key)
    @items[index(key,@items.length)].value
  end

  #multiply size by 2
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

  # Simple method to return the number of items in the hash
  def size
    return @items.length
  end

end
