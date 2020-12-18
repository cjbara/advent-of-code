valid = []
File.foreach("input.txt") do |line|
  rule, pw = line.split(":")
  number, char = rule.split(" ")
  min, max = number.split("-").map(&:to_i)

  pw_chars = Hash.new(0)
  pw.each_char { |c| pw_chars[c] += 1 }

  if min <= pw_chars[char] && pw_chars[char] <= max
    valid << pw
  end
end
puts valid.count
