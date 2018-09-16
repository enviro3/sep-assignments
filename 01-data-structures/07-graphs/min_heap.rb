require_relative 'actor_with_distance'

class MinHeap
  attr_reader :heap

  def initialize(first_actor_with_distance)
    @heap = [first_actor_with_distance]
  end

  def findLeftIndex(my_index)
    return (my_index * 2) + 1
  end

  def findRightIndex(my_index)
    return (my_index * 2) + 2
  end

  def findParent(my_index)
    return (my_index - 1) / 2
  end

  def switchValuesAtIndices(index1,index2)
    temp = @heap[index1]
    @heap[index1] = @heap[index2]
    @heap[index2] = temp
  end

  def insert(actor_with_distance)
    @heap.push(actor_with_distance)
    actor_with_distance_index = @heap.length() - 1
    fixUp(actor_with_distance_index)
  end

  def fixUp(actor_with_distance_index)
    actor_with_distance = @heap[actor_with_distance_index]
    parent_index = findParent(actor_with_distance_index)
    if parent_index < 0
      return
    end
    parent_value = @heap[parent_index]
    if actor_with_distance.distance_from_kevin < parent_value.distance_from_kevin
      switchValuesAtIndices(actor_with_distance_index, parent_index)
      fixUp(parent_index)
    end
  end

  def fixDown(actor_with_distance_index)
    right_child_index = findRightIndex(actor_with_distance_index)
    left_child_index = findLeftIndex(actor_with_distance_index)

    #case there are no children
    if right_child_index >= @heap.length && left_child_index >= @heap.length
      return
    end

    #case there is only one left child
    if left_child_index < @heap.length && right_child_index >= @heap.length
      if @heap[actor_with_distance_index].distance_from_kevin > @heap[left_child_index].distance_from_kevin
        switchValuesAtIndices(actor_with_distance_index, left_child_index)
        fixDown(left_child_index)
      end
    end

    #case there are two children
    if right_child_index < @heap.length && left_child_index < @heap.length
      # TODO, irrelevant if children have children
      if @heap[right_child_index].distance_from_kevin < @heap[left_child_index].distance_from_kevin
        if @heap[right_child_index].distance_from_kevin < @heap[actor_with_distance_index].distance_from_kevin
          switchValuesAtIndices(actor_with_distance_index, right_child_index)
          fixDown(right_child_index)
        end
      elsif @heap[right_child_index].distance_from_kevin >= @heap[left_child_index].distance_from_kevin
        if @heap[left_child_index].distance_from_kevin < @heap[actor_with_distance_index].distance_from_kevin
          switchValuesAtIndices(actor_with_distance_index, left_child_index)
          fixDown(left_child_index)
        end
      end
    end
  end

  def delete_minimum()
    actor_with_distance_index = @heap.length() - 1
    if @heap == nil
      return nil
    end
    if @heap.length == 0
      return nil
    end
    @heap[0] = @heap[@heap.length - 1]
    #@heap.index(actor_with_distance)
    @heap.pop()
    fixDown(0)
  end

  def find(actor_with_distance)
    #find MovieRating that matches the data
    if actor_with_distance == nil
      return nil
    end
    for current_actor_with_distance in @heap do
      if current_actor_with_distance.actor_name == actor_with_distance.actor_name
        return current_actor_with_distance
      end
    end
    return nil
  end

  def printIndex(index)
    #case where index is invalid
    if index >= @heap.length
      return
    end
    puts @heap[index].actor_name + ': ' + @heap[index].distance_from_kevin.to_s
    printIndex(findLeftIndex(index))
    printIndex(findRightIndex(index))

  end

  def print()
    printIndex(0)
  end

end
