def bubble_sort_by(arr)
  i = arr.length
  n = arr.count

  while i >= 0
    for j in 0...n - 1
      if block_given?
        a = yield(arr[j], arr[j + 1])
      else
        a = arr[j + 1] <=> arr[j]
      end
      if a > 0
        arr[j], arr[j + 1] = arr[j + 1], arr[j]
      end
    end
    i -= 1
  end
  arr
end

# works with the block
output = bubble_sort_by(["hi", "hello", "hey"]) do |left, right|
  left.length - right.length
end
# works without block - by default ascending
output = bubble_sort_by(["hi", "hello", "hey"])
p output
