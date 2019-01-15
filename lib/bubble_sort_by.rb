# Implementation of Bubble Sort algorithm
class Array
  def bubble_sort_by
    i = length

    while i >= 0
      each_with_index do |_, j|
        j += 1
        break if self[j].nil?

        a = if block_given?
              yield(self[j - 1], self[j])
            else
              self[j - 1] <=> self[j]
            end
        self[j - 1], self[j] = self[j], self[j - 1] if a > 0
      end
      i -= 1
    end
    self
  end
end
