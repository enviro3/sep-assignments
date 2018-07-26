require_relative 'linked_list'
require 'benchmark'

array = []
linkedList = LinkedList.new()


# Comparing 10,000 items in Array to appending 10,000 items to a Linked List
n = 10000
Benchmark.bm do |x|
  x.report("append 10,000 item Array ") { n.times do array.push("Mark"); end  }
  x.report("append 10,000 item LinkedList"){n.times do linkedList.add_to_tail(Node.new("hello")); end}
end

#Compare the time it takes to access the 5000th element of the Array and the 5000th Node in the Linked List.
n = 5000
Benchmark.bm do |x|
  x.report("access 50000th item in Array ") { array[5000]  }
  x.report("access 50000th item in LinkedList") {
    result = linkedList.head
    n.times do |a|
      result = result.next
      if result == nil
        break
      end
    end
  }
end


#Compare the time it takes to remove the 5000th element from the Array to removing the 5000th Node in the Linked List.
n = 5000
Benchmark.bm do |x|
  x.report("remove 5000th item from Array") { array.delete_at(5000)}
  x.report("remove 5000th item from LinkedList"){
    result = linkedList.head
    n.times do |a|
      result = result.next
      if result == nil
        break
      end
    end
    linkedList.delete(result)
  }
end


#In the Array, the 5001st item becomes the 5000th, and so on.
# [20,4,70]
# [20, 20, 4]
# [20, 20, 20]
n = 5000
Benchmark.bm do |x|
  x.report("Array shifting by 1 from 50001 ") {
    for i in 5001..0
      array[i+1] = array[i]
    end
  }
end
