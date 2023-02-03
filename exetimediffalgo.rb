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