test_array = [1,2,3,4,5]

module Enumerable

      def my_each
      	i = 0
      	while i < self.size
      		yield(self[i])
      		i += 1
      	end
      end

      def my_each_with_index
      	i = 0
      	while i < self.size
      		yield(self[i], i)
      		i += 1
      	end
      end

end

test_array.my_each {|x| puts x * 10}

test_array.my_each_with_index {|x, y| puts "Item: #{x}, Item Index: #{y}"}