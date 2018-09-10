require_relative 'binary_tree/binary_search_tree'
require_relative 'binary_tree/node'
require_relative 'min_heap/min_heap'
require_relative 'min_heap/movie_rating'
require 'benchmark'



minHeap = MinHeap.new(MovieRating.new("The Matrix", 87))
binarySearchTree = BinarySearchTree.new(Node.new("root", 77))

minHeap2 = MinHeap.new(MovieRating.new("The Matrix", 87))
binarySearchTree2 = BinarySearchTree.new(Node.new("root", 77))
# Comparing 10,000 items in minHeap to appending 10,000 items to a binarySearchTree

n = 5000
Benchmark.bm do |x|
  puts "Compare 5,000 items"
  x.report("append 5,000 items minHeap") { for i in 1..n do minHeap.insert(MovieRating.new("some_title" + i.to_s, i)); end  }
  x.report("append 5,000 items binarySearchTree"){ for i in 1..n do binarySearchTree.insert(binarySearchTree.root, Node.new("some_title" + i.to_s, i)); end}

  puts "Find 1000th item"
  #Find 1000th item in each
  x.report("find item minHeap") { minHeap.find(MovieRating.new("some_title500", 1000))}
  x.report("find item binarySearchTree"){ binarySearchTree.find(binarySearchTree.root, Node.new("some_title10", 1000))}

  puts "Delete an item"
  #Delete an item in each
  x.report("delete item in minHeap") { minHeap.delete_minimum(); }
  x.report("delete item in binarySearchTree"){ binarySearchTree.delete(binarySearchTree.root, Node.new("some_title", 500)) }
end

n = 50
for i in 1..n do
  minHeap2.insert(MovieRating.new("some_title" + i.to_s, i))
end
for i in 1..n do
  binarySearchTree2.insert(binarySearchTree2.root, Node.new("some_title" + i.to_s, i))
end

#print heap and binary tree
puts "I AM A HEAP"
minHeap2.print()
puts "I AM A BINARY TREE"
binarySearchTree2.printf()
