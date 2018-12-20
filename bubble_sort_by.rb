def bubble_sort_by arr
	length = arr.count
	index = length

	while index >= 0 do

		for j in 0...index-1 do
			a = yield(arr[j],arr[j+1])
			if a > 0
				arr[j],arr[j+1]=arr[j+1],arr[j]
							else
			end
		end
		index -= 1

			end
	arr
end


