def bad_two_sum?(arr, target_sum)
  (0...arr.length-1).each do |idx1|
    (idx1+1...arr.length).each do |idx2|
      return true if arr[idx1] + arr[idx2] == target_sum
    end
  end
  false
end

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false
puts

def okay_two_sum?(arr, target_sum)
  arr.each_with_index do |ele, idx|
    arr_copy = arr.dup
    arr_copy.delete_at(idx)
    return true if bsearch(arr_copy, target_sum - ele) != nil
  end
  false
end

def bsearch(arr, val)
  return nil if arr.empty?

  mid = arr.length / 2
  if arr[mid] == val
    return mid
  elsif val < arr[mid]
    bsearch(arr[0...mid], val)
  else
    result = bsearch(arr[mid+1..-1], val)
    return nil if result == nil
    mid + 1 + result
  end
end

arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false
puts 

# p bsearch(arr, 10 - 0)
# p bsearch(arr, 10 - 1)
# p bsearch(arr, 10 - 5)
# p bsearch(arr, 10 - 7)