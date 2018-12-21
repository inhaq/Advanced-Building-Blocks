class Array
	

def bubble_sort_by 
  i = self.length
  n = self.count
	
  while i >= 0 
    for j in 0...n - 1
		if block_given?
			
        a = yield(self[j],self[j+1])
      else
        a = self[j] <=> self[j+1]
      end
      if a > 0
        self[j], self[j + 1] = self[j + 1], self[j]
      end
    end
    i -= 1
  end
  self
end
end
# works with the block
print [3,2,1,4].bubble_sort_by {|a,b|
	b-a
}

# works without block - by default ascending
print ['hi','bye','guy','ace'].bubble_sort_by 