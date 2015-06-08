

module Enumerable

      def my_each
      	i = 0
      	while i < self.size
      		yield(self.to_a[i])
      		i += 1
      	end
      end

      def my_each_with_index
      	i = 0
      	while i < self.size
      		yield(self.to_a[i], i)
      		i += 1
      	end
      end

      def my_select
      	return_array = []
      	self.to_a.my_each {|num| return_array << num if yield(num)}
      	return_array
      end

      def my_all?
      	self.to_a.my_each do |element|
      		unless yield(element) 
      			return false
      		end
      	end
      	true
      end

      def my_any?
      	self.my_each do |element|
      		if yield(element)
      			return true
      		end
      	end
      	false
      end

      def my_none?
      	self.my_each do |element|
      		if yield(element)
      			return false
      		end
      	end
      	true
      end

      def my_count(item_to_count = nil)
      	items_counted = 0
      	if item_to_count
      		self.to_a.my_each { |item| items_counted += 1 if item == item_to_count }
      	elsif block_given?
      		self.to_a.my_each { |item| items_counted += 1 if yield(item) }
      	else
      		items_counted = self.size
      	end
		items_counted
      end

      def my_map
      	return_array = []
      	self.to_a.my_each {|element| return_array << yield(element)}
      	return_array
      end

      def my_inject
      	result_memo = self.to_a[0]
      	self.to_a[1..-1].my_each { |element| result_memo = yield(result_memo, element)}
      	return result_memo
      end

end

def multiply_els(elements)
	elements.my_inject {|product, element| product * element}
end

test_array = [1,2,3,4,5,3]
test_array.my_each {|x| puts x * 10}
(5..10).my_each {|x| puts x * 10}
test_array.my_each_with_index {|x, y| puts "Item: #{x}, Item Index: #{y}"}
p test_array.my_select {|num| num.even?}
p test_array.my_all? {|num| num.even?}
p test_array.my_any? {|num| num.even?}
p test_array.my_none? {|num| num == 3}
p test_array.my_count
p test_array.my_count(3)
p test_array.my_count {|num| num >= 3}
p test_array.my_map {|x| "#{x} * 3 = #{3 * x}"} 
p (5..10).my_map {|x| "#{x} * 3 = #{3 * x}"} 
p test_array.my_inject { |sum, n| sum + n } 
p (5..10).my_inject { |sum, n| sum + n } 
p multiply_els([2,4,5])
p [2,4,5].my_inject { |sum, n| sum * n } 

p ["a", "b", "c"].my_inject { |sum, n| sum + n } 


