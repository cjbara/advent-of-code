require 'set'

counts = []
current = Hash.new(0)
current_count = 0

def total(c, count)
  amount = []
  c.each do |k, v|
    if v == count
      amount << k
    end
  end
  amount.count
end

File.foreach("input.txt") do |line|
  line.strip!

  if line == ""
    counts << total(current, current_count)
    current = Hash.new(0)
    current_count = 0
    next
  end

  current_count += 1
  line.chars.each do |c|
    current[c] += 1
  end
end
counts << total(current, current_count)

puts counts
puts counts.inject(0){ |sum,x| sum + x }
