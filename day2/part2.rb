valid = []
File.foreach("input.txt") do |line|
  rule, pw = line.split(":")
  number, char = rule.split(" ")
  pw.strip!
  min, max = number.split("-").map { |x| x.to_i - 1 }

  if (pw[min] == char) ^ (pw[max] == char)
    valid << pw
  end
end
puts valid.count
