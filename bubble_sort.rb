# using each_with_index
def bubble(arr)
  arr.each_with_index do |x, i|
    arr.each_with_index do |y, j|
      j += 1
      if arr[j] == nil
        break
      end
      if arr[j - 1] > arr[j]
        arr[j - 1], arr[j] = arr[j], arr[j - 1]
      end
    end
  end
end

# using while & for
def bubble_sort(arr)
  i = arr.count
  while i >= 0
    for j in 0...i - 1
      if arr[j] > arr[j + 1]
        arr[j], arr[j + 1] = arr[j + 1], arr[j]
      end
    end
    i -= 1
  end
  arr
end

p bubble([1, 8, 3, 6, 4, 5])
p bubble_sort([1, 8, 3, 6, 4, 5])
