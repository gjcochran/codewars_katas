def dbl_linear(idx)
  res = [1]
  i = 0
  while i < idx
    res << 2 * res[i] + 1
    res << 3 * res[i] + 1
    res.sort!
    i += 1
  end
  res.uniq[idx]
end

p dbl_linear(10)
p dbl_linear(20)

# solved but not efficient enough. come back to later to refactor...
