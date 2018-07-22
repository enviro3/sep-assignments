class Node
  attr_accessor :next
  attr_accessor :data

  def initialize(data)
    @data = data
    @next = nil
  end

  def setNextNode(node)
    @next = node
  end

end
