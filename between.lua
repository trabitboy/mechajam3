--returns boolean > tests if first value is between the 2nd and 3rd ( puts them in right order)
function between(t,a,b)
  if b>=a then
    second=b
    first =a
  else
    second=a
    first =b
  end
  
  if first <= t and t<=second then
      return true
  else
    return false
  end
end