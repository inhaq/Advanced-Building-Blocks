module Enumerable
  #  my_each with while loop
  def my_each
    (self.is_a? Hash) ? a = self.to_a : a = self
    i = 0
    while i < a.count
      yield a[i]
      i += 1
    end
  end

  # my_each_with_index using while loop
  def my_each_with_index
    (self.is_a? Hash) ? a = self.to_a : a = self
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
        arr[k] = v if a
      end
    else
      arr = []
      self.my_each do |k|
        a = yield(k)
        arr << k if a
      end
    end
    arr
  end

  # my_all
  def my_all?
    if self.is_a? Hash
        self.my_each do |k, v|
        a = yield(v)
        !a ? false : true
      end
    else
      self.my_each do |k|
        a = yield(k)
        !a ? false : true
      end
    end
  end

  # my_any
  def my_any?
    if self.is_a? Hash
      self.my_each do |k, v|
        a = yield(v)
        return true if a
      end
    else
      self.my_each do |k|
        a = yield(k)
        return true if a
      end
    end
    false
  end

  # my_none
  def my_none?
    if self.is_a? Hash
      self.my_each do |k, v|
        a = yield(v)
        return false if a
      end
    else
      self.my_each do |k|
        a = yield(k)
        return false if a
      end
    end
    true
  end

  def my_count
    count = 0
    i = 0
    if self.is_a? Hash
      c = self.keys
      while c[i]
        count += 1
        i += 1
      end
    else
      while self[i]
        count += 1
        i += 1
      end
    end
    count
  end

  def my_map
    if self.is_a? Hash
      result = {}
      self.my_each do |k, v|
        a = yield(k, v)
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