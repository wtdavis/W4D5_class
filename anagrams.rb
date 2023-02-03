def first_anagram?(str1, str2)
  str1.split("").permutation.to_a.map { |ele| ele.join }.include?(str2)
end

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true

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