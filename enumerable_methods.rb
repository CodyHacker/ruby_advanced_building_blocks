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

      def my_select
      	return_array = []
      	self.my_each {|num| return_array << num if yield(num)}
      	return_array
      end

      def my_all?
      	my_each do |element|
      		unless yield(element) 
      			return false
      		end
      	end
      	true
      end

end

test_array.my_each {|x| puts x * 10}

test_array.my_each_with_index {|x, y| puts "Item: #{x}, Item Index: #{y}"}

p test_array.my_select {|num| num.even?}

p test_array.my_all? {|num| num > 6}

