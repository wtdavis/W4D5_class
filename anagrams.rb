def first_anagram?(str1, str2)
  str1.split("").permutation.to_a.map { |ele| ele.join }.include?(str2)
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

def first_anagram?(str1, str2)
  anagram_helper(str1).include?(str2)
end

def anagram_helper(str)
  return [str] if str.length < 2

  first_char = str[0]
  prev_result = anagram_helper(str[1..-1])
  # p prev_result

  new_result = []
  prev_result.each do |substr|
    (0..substr.length).each do |idx|
      substr_copy = substr.dup
      new_result << substr_copy.insert(idx, first_char)
    end
  end
  new_result
end

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true
puts


def second_anagram?(str1, str2)
  return false if str1.length != str2.length

  str2 = str2.split("")
  str1.each_char do |char|
    if str2.index(char) != nil 
      str2.delete_at(str2.index(char))
    end
  end
  return str2.empty?
end

p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true
puts

def third_anagram?(str1, str2)
  return str1.split("").sort == str2.split("").sort
end

p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true
puts

def fourth_anagram?(str1, str2)
    hashagram(str1) == hashagram(str2)
end

def hashagram(str)
    anahash = Hash.new(0)
    str.each_char {|char| anahash[char] += 1}
    return anahash

end
p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true
puts

def bonagram?(str1, str2)
  return false if str1.length != str2.length
  bonahash = Hash.new(0)
  (0...str1.length).each do |idx|
    bonahash[str1[idx]] += 1
    bonahash[str2[idx]] -= 1
  end
  return bonahash.values.all?{|val| val == 0}
end
p bonagram?("gizmo", "sally")    #=> false
p bonagram?("elvis", "lives")    #=> true