def my_min_1(arr)
  arr.each do |ele|
    return ele if arr.all? { |ele1| ele1 >= ele }
  end
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min_1(list)  # =>  -5

def my_min_2(arr)
  min = arr[0]
  arr.each do |ele|
    min = ele if min > ele
  end
  min
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min_2(list)  # =>  -5

def largest_contiguous_subsum_1(arr)
  subarrs = []
  (0...arr.length).each do |idx1|
    (idx1...arr.length).each do |idx2|
      subarrs << arr[idx1..idx2]
    end
  end
  return subarrs.map {|subarr| subarr.sum}.max
end
list = [5, 3, -7]
p largest_contiguous_subsum_1(list)
list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum_1(list) # => 8 (from [7, -6, 7])
list = [-5, -1, -3]
p largest_contiguous_subsum_1(list) 


def largest_contiguous_subsum_2(arr)
    current_sum = 0
    largest_sum = nil
    arr.each do |ele|
      current_sum += ele
      largest_sum = current_sum if largest_sum == nil || current_sum > largest_sum 
      current_sum = 0 if current_sum < 0 
    end
    return largest_sum
end

list = [5, 3, -7]
p largest_contiguous_subsum_2(list)
list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum_2(list) # => 8 (from [7, -6, 7])
list = [-5, -1, -3]
p largest_contiguous_subsum_2(list) 

a = "string"
p a.permutation