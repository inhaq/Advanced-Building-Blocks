# Enumerable methods
module Enumerable
  #  my_each with while loop
  def my_each
    a = (is_a? Hash) ? to_a : self
    i = 0
    while i < a.count
      yield a[i]
      i += 1
    end
  end

  # my_each_with_index using while loop
  def my_each_with_index
    a = (is_a? Hash) ? to_a : self
    i = 0
    while i < a.count
      yield a[i], i
      i += 1
    end
  end

  # my_select using while loop
  def my_select
    if is_a? Hash
      arr = {}
      my_each do |k, v|
        a = yield(k, v)
        arr[k] = v if a
      end
    else
      arr = []
      my_each do |k|
        a = yield(k)
        arr << k if a
      end
    end
    arr
  end

  # my_all
  def my_all?
    if is_a? Hash
      my_each do |_, v|
        a = yield(v)
        !a ? false : true
      end
    else
      my_each do |k|
        a = yield(k)
        !a ? false : true
      end
    end
  end

  # my_any
  def my_any?
    if is_a? Hash
      my_each do |_, v|
        a = yield(v)
        return true if a
      end
    else
      my_each do |k|
        a = yield(k)
        return true if a
      end
    end
    false
  end

  # my_none
  def my_none?
    if is_a? Hash
      my_each do |_, v|
        a = yield(v)
        return false if a
      end
    else
      my_each do |k|
        a = yield(k)
        return false if a
      end
    end
    true
  end

  def my_count
    count = 0
    i = 0
    if is_a? Hash
      c = keys
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
    if is_a? Hash
      result = {}
      my_each do |k, v|
        yield(k, v)
      end
    else
      result = []
      my_each do |v|
        a = yield(v)
        result << a
      end
      result
    end
  end

  def my_inject
    result = 0
    my_each do |i|
      result = yield(result, i)
    end
    result
  end

  def multiply_els
    result = 1
    my_each do |i|
      result = yield(result, i)
    end
    result
  end
end
