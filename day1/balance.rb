
x = {}
File.foreach("input.txt") do |line| 
  i = line.to_i
  z = 2020-i
  x[i] = z
end

puts x.count

x.each do |k,v|
  # Part 2
  #x.each do |k2,v2|
  #  z = 2020 - (k + k2)
  #  if x[z]
  #    puts k, k2, z, (k*k2*z)
  #  end
  #end

  # Part 1
  if x[v]
    puts k, v, k*v
  end
end

