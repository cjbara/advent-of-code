require 'set'

bags = {}
child_bags = {}

File.foreach("input.txt") do |line|
  parent, counts = line.split(" bags contain ")
  counts.strip!
  next if counts == "no other bags."
  counts = counts.strip.split(", ")

  bags[parent] = {}

  counts.each do |c| 
    count, k1, k2, *_ = c.split(" ")
    child = "#{k1} #{k2}"
    bags[parent][child] = count.to_i

    if !child_bags[child]
      child_bags[child] = []
    end

    child_bags[child] << parent
  end
end

@bags = bags
@child_bags = child_bags

def traverse(color)
  colors = Set.new
  
  if @child_bags[color].nil?
    return colors
  end

  @child_bags[color].each do |p|
    next unless colors.add?(p)
    colors.merge(traverse(p))
  end

  colors
end

def o(color, count, spaces)
  spaces.times { print("  ") }
  print("#{color}: #{count}\n")
end

def nested(color, spaces=0)
  if @bags[color].nil?
    return 0
  end

  count = 0
  @bags[color].each do |c, n|
    count += n
    count += n * nested(c, spaces + 1)
  end

  count
end

puts nested("shiny gold")
