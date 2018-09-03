require_relative 'node'

class MinHeap
  attr_reader :root

  def initialize(root)
    @root = root #root is a node
  end

  def insert(root, node)
    if root == nil
      @root = node
    elsif root.rating <= node.rating
      if root.right == nil
        root.right = node
      else
        insert(root.right, node)
      end

    elsif root.rating > node.rating
      if root.left == nil
        root.left = node
      else
        insert(root.left, node)
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    return find_with_parent(root, data, nil)[0]
  end

  # Recursive Depth First Search
  def find_with_parent(current_node, data, parent)
    if current_node == nil
      return nil, nil
    end
    if current_node.title == data
      return current_node, parent
    end
    if current_node.left != nil
      left_branch_node_and_parent = find_with_parent(current_node.left, data, current_node)
      if left_branch_node_and_parent[0] != nil
        return left_branch_node_and_parent
      end
    end
    if current_node.right != nil
      right_branch_node_and_parent = find_with_parent(current_node.right, data, current_node)
      if right_branch_node_and_parent[0] != nil
        return right_branch_node_and_parent
      end
    end
    return nil, nil
  end

  def delete(root, data) #root is a node, not @root
    node_and_parent = find_with_parent(root, data, nil) #node_and_parents looks like this [node, parent]
    node = node_and_parent[0]
    parent = node_and_parent[1]
    if node == nil
      return
    elsif node.left == nil && node.right == nil
      if parent == nil
        @root = nil
        return
      end
      if parent.right == node
        parent.right = nil
        return
      end
      if parent.left == node
        parent.left = nil
        return
      end
    end

    #case when there is one child
    if node.left != nil && node.right == nil
      #remove node and replace it with its child
      if parent == nil
        @root = node.left
        return
      end
      if parent.right == node
        parent.right = node.left
        return
      end
      if parent.left == node
        parent.left = node.left
        return
      end
    end

    if node.left == nil && node.right != nil
      if parent == nil
        @root = node.right
        return
      end
      if parent.right == node
        parent.right = node.right
        return
      end
      if parent.left == node
        parent.left = node.right
        return
      end
    end

    #case when there are two children
    there_are_two_children = node.left != nil && node.right != nil
    if there_are_two_children
      min_node_and_parent = find_min_node(node.right, node)
      min_node = min_node_and_parent[0]
      min_parent = min_node_and_parent[1]
      if parent == nil
        @root = min_node
      elsif parent.right == node
        parent.right = min_node
      elsif parent.left == node
        parent.left = min_node
      end
      min_parent.left = min_node.right
      if min_node.left != node.left
        min_node.left = node.left
      end
      if min_node != node.right
        min_node.right = node.right
      end
      return
    end
  end

  def find_min_node(node, parent)
    while node.left != nil
      parent = node
      node = node.left
    end
    return node, parent
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    tree_array = []
    tree_array.push(@root)
    while tree_array.length != 0
      puts tree_array[0].title.to_s + ": " + tree_array[0].rating.to_s
      if tree_array[0].left != nil
        tree_array.push(tree_array[0].left)
      end

      if tree_array[0].right != nil
        tree_array.push(tree_array[0].right)
      end
      tree_array.shift()
    end

  end
end
