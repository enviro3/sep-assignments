require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail
  attr_accessor :size  #every time add/remove, want to implement/decrement, when add item to Hashtable, check size, if 5 more resize

  def initialize()
    @size = 0
  end
  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    @size += 1
    if @head == nil
      @head = node
    else
      current_node = @head
      while current_node.next != nil
        current_node = current_node.next
      end
      current_node.next = node
    end
    @tail = node
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    delete(@tail)
  end

  # Returns the node that matches the key
  def find(key)
    current_node = @head
    while current_node != nil
      if current_node.key == key
        return current_node
      end
      current_node = current_node.next
    end
    return nil
  end

  # This method prints out a representation of the list.
  def print
    current_node = @head
    puts @head.data
    while current_node.next != nil
      current_node = current_node.next
      puts current_node.data
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if @head == nil
      return nil
    elsif @head == @tail
      @head = nil
      @tail = nil
      @size -= 1
    elsif node == @head
      @head = @head.next
      @size -= 1
    else
      current_node = @head
      while current_node.next != node
        current_node = current_node.next
      end
      current_node.next = current_node.next.next
      @size -= 1
      if node == @tail
        @tail = current_node
      end
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    previous_head = @head
    @head = node
    @head.next = previous_head
    @size += 1
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    delete(@head)
  end
end
