# using each_with_index
def bubble(arr)
  arr.each do
    arr.each_with_index do |_, j|
      j += 1
      break if arr[j].nil?

      arr[j - 1], arr[j] = arr[j], arr[j - 1] if arr[j - 1] > arr[j]
    end
  end
end

# using while & for
def bubble_sort(arr)
  i = arr.count
  while i >= 0
    for j in 0...i - 1
      arr[j], arr[j + 1] = arr[j + 1], arr[j] if arr[j] > arr[j + 1]
    end
    i -= 1
  end
  arr
end
