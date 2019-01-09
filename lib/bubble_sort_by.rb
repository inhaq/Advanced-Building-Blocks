# Implementation of Bubble Sort algorithm
class Array
  def bubble_sort_by
    i = length
    n = count

    while i >= 0
      for j in 0...n - 1
        a = if block_given?
              yield(self[j], self[j + 1])
            else
              self[j] <=> self[j + 1]
            end
        self[j], self[j + 1] = self[j + 1], self[j] if a > 0
      end
      i -= 1
    end
    self
  end
end
