def bubble_sort(my_array)
	my_array.size.times do
		my_array.each_index do |index| 
			 if my_array[index + 1] && my_array[index] > my_array[index + 1] 
			 	my_array[index],my_array[index + 1] = my_array[index + 1],my_array[index] #swap 
			 end
		end
	end
	my_array
end

p bubble_sort([4,-2,3,75,0,2,1])