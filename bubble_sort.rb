def bubble_sort(my_array)
	((my_array.size) -1).times do
		my_array.each_index do |index| 
			 if my_array[index + 1] && my_array[index] > my_array[index + 1] 
			 	my_array[index],my_array[index + 1] = my_array[index + 1],my_array[index] #swap 
			 end
		end
	end
	my_array
end

def bubble_sort_by(my_array)
	((my_array.size) -1).times do
		index = 0
		while index < my_array.size
			if my_array[index + 1] && (yield(my_array[index], my_array[index + 1])) < 0 
				my_array[index],my_array[index + 1] = my_array[index + 1],my_array[index] #swap 
			end
	        index += 1
	    end
	end
	my_array
end


p bubble_sort([4,-2,3,75,0,2,1])

p bubble_sort_by(["hi","hello","hey","Mike", "to", "a"]) { |left,right|
    right.length - left.length
}





