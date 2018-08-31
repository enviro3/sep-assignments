require_relative 'node'

class BinarySearchTree

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
    elsif current_node.title == data
      return current_node, parent
    elsif current_node.left != nil
      return find_with_parent(current_node.left, data, current_node)
    elsif current_node.right != nil
      return find_with_parent(current_node.right, data, current_node)
    end
    return nil, nil
  end

  def delete(root, data) #root is a node, not @root
    node_and_parent = find_with_parent(root, data, nil) #node_and_parents looks like this [node, parent]
    node = node_and_parent[0]
    parent = node_and_parent[1]
    if node.left == nil && node.right == nil && parent != nil
      if parent.right == node
        parent.right == nil
      elsif parent.left == node
        parent.left == nil
    elsif node.left == nil && node.right == nil && parent == nil
      return nil
    end

    #case when there are children



  end

  # Recursive Breadth First Search
  def printf(children=nil)
  end
end
