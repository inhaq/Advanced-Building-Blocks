

module Enumerable
  #  my_each with while loop
  def my_each
    if self.is_a? Hash
      a = self.to_a
    else a = self     end
    i = 0
    while i < a.count
      yield a[i]
      i += 1
    end
  end

  # my_each_with_index using while loop
  def my_each_with_index
    if self.is_a? Hash
      a = self.to_a
    else a = self     end
    i = 0
    while i < a.count
      yield a[i], i
      i += 1
    end
  end

  # my_select using while loop
  def my_select
    if self.is_a? Hash
      arr = {}
      self.my_each do |k, v|
        a = yield(k, v)

        if a
          arr[k] = v
        end
      end
    else
      arr = []
      self.my_each do |k|
        a = yield(k)

        if a
          arr << k
        end
      end
    end

    p arr
  end

  # my_all
  def my_all?
    if self.is_a? Hash
      p self
      self.my_each do |k, v|
        a = yield(v)
        if !a
          return false
        else
          return true
        end
      end
    else
      self.my_each do |k|
        a = yield(k)
        if !a
          return false
        else
          return true
        end
      end
    end
  end

  # my_any
  def my_any?
    if self.is_a? Hash
      self.my_each do |k, v|
        a = yield(v)
        if a
          return true
        end
      end
    else
      self.my_each do |k|
        a = yield(k)
        if a
          return true
        end
      end
    end
    return false
  end

  # my_none
  def my_none?
    if self.is_a? Hash
      self.my_each do |k, v|
        a = yield(v)
        if a
          return false
        end
      end
    else
      self.my_each do |k|
        a = yield(k)
        if a
          return false
        end
      end
    end
    return true
  end

  def my_count
    count = 0
    i = 0
    if self.is_a? Hash
      c = self.keys
      while (c[i])
        count += 1
        i += 1
      end
    else
      while (self[i])
        count += 1
        i += 1
      end
    end
    count
  end

  def my_map(proc= false)
       if proc.is_a? Proc
           p "yahooooo"
       else
           p "nahoooo"
       end
    if self.is_a? Hash
      result = {}
      self.my_each do |k, v|
        a = yield(k, v)
        p result[k] = a
      end
    else
      result = []
      self.my_each do |v|
        a = yield(v)
        result << a
      end

      result
    end
  end

  def my_inject
    result = 0
    self.my_each do |i|
      result = yield(result, i)
    end
    result
  end

  def multiply_els
    result = 1
    self.my_each do |i|
      result = yield(result, i)
    end
    result
  end
end

b = [1, 2, 3, 4, 5]
 example = Proc.new { |i| i + 1 }
  b.my_map(&example)
# b.my_map{|x| x * 2}
g = {a: 1, b: 2, c: 3, d: 4}
e = [3, 7, 6, "hello", 5, 2, 4, 8, 12]

# e.my_each_with_index do |k, v|
#     p k, v
# end

# e.each_with_index do |k,v|
#     p k,v
# end

# e.my_select { |v| v % 3 == 0 }
# g.my_select {|k,v| v % 2 == 0}
# a = [1, 5, 3]
# p e.my_map {|v| v * 2} 

# b = [1,2,3,4,5]

# p b.multiply_els {|a,b|a*b}
