require_relative 'movie_rating'

class MinHeap
  attr_reader :heap

  def initialize(first_movie_rating)
    @heap = [first_movie_rating] #first_movie_rating is a MovieRating
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

  def insert(movie_rating)
    @heap.push(movie_rating)
    movie_rating_index = @heap.length() - 1
    fixUp(movie_rating_index)
  end

  def fixUp(movie_rating_index)
    movie_rating = @heap[movie_rating_index]
    parent_index = findParent(movie_rating_index)
    if parent_index < 0
      return
    end
    parent_value = @heap[parent_index]
    if movie_rating.rating < parent_value.rating
      switchValuesAtIndices(movie_rating_index, parent_index)
      fixUp(parent_index)
    end
  end

  def fixDown(movie_rating_index)
    right_child_index = findRightIndex(movie_rating_index)
    left_child_index = findLeftIndex(movie_rating_index)

    #case there are no children
    if right_child_index >= @heap.length && left_child_index >= @heap.length
      return
    end

    #case there is only one left child
    if left_child_index < @heap.length && right_child_index >= @heap.length
      if @heap[movie_rating_index].rating > @heap[left_child_index].rating
        switchValuesAtIndices(movie_rating_index, left_child_index)
        fixDown(left_child_index)
      end
    end

    #case there are two children
    if right_child_index < @heap.length && left_child_index < @heap.length
      # TODO, irrelevant if children have children
      if @heap[right_child_index].rating < @heap[left_child_index].rating
        if @heap[right_child_index].rating < @heap[movie_rating_index].rating
          switchValuesAtIndices(movie_rating_index, right_child_index)
          fixDown(right_child_index)
        end
      elsif @heap[right_child_index].rating >= @heap[left_child_index].rating
        if @heap[left_child_index].rating < @heap[movie_rating_index].rating
          switchValuesAtIndices(movie_rating_index, left_child_index)
          fixDown(left_child_index)
        end
      end
    end
  end

  def delete_minimum()
    movie_rating_index = @heap.length() - 1
    if @heap == nil
      return nil
    end
    if @heap.length == 0
      return nil
    end
    @heap[0] = @heap[@heap.length - 1]
    #@heap.index(movie_rating)
    @heap.pop()
    fixDown(0)
  end

  def find(movie_rating)
    #find MovieRating that matches the data
    if movie_rating == nil
      return nil
    end
    for current_movie_rating in @heap do
      if current_movie_rating.title == movie_rating.title
        return current_movie_rating
      end
    end
    return nil
  end

  def printIndex(index)
    #case where index is invalid
    if index >= @heap.length
      return
    end
    puts @heap[index].title + ': ' + @heap[index].rating.to_s
    printIndex(findLeftIndex(index))
    printIndex(findRightIndex(index))

  end

  def print()
    printIndex(0)
  end

end
