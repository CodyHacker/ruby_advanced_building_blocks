

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

      def my_any?
      	my_each do |element|
      		if yield(element)
      			return true
      		end
      	end
      	false
      end

      def my_none?
      	my_each do |element|
      		if yield(element)
      			return false
      		end
      	end
      	true
      end

      def my_count(item_to_count = nil)
      	items_counted = 0
      	if item_to_count
      		self.my_each { |item| items_counted += 1 if item == item_to_count }
      	elsif block_given?
      		self.my_each { |item| items_counted += 1 if yield(item) }
      	else
      		items_counted = self.size
      	end
		items_counted
      end

end

test_array = [1,2,3,4,5,3]

test_array.my_each {|x| puts x * 10}

test_array.my_each_with_index {|x, y| puts "Item: #{x}, Item Index: #{y}"}

p test_array.my_select {|num| num.even?}

p test_array.my_all? {|num| num.even?}

p test_array.my_any? {|num| num.even?}

p test_array.my_none? {|num| num == 3}

p test_array.my_count() {|num| num > 0}

