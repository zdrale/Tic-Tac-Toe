def validate_name(name1, name2)
  if name1 == name2
    puts ' Same name is not allowed. Give different names for either one: '
    return false
  end
  if [name1.size, name2.size].any? { |elem| elem < 2 }
    puts ' Invalid name. Name should have more than one character.s Change one or two of the names: '
    return false
  end
  true
end

def validate_symbol(sym1, sym2)
  if sym1 == sym2
    puts ' Same symbols are not allowed. Change either of one: '
    return false
  end
  if sym1.size > 1 || sym2.size > 1
    puts 'Invalid symbol is used, number or more than one character not allowed. Re enter again: '
    return false
  end
  true
end
