test_values = {
  "FBFBBFFRLR" => [44, 5, 357],
  "BFFFBBFRRR" => [70, 7, 567],
  "FFFBBBFRRR" => [14, 7, 119],
  "BBFFBBFRLL" => [102, 4, 820],
}

def calc_seat(v)
  row = v[0...7].gsub("F", "0").gsub("B", "1").to_i(2)
  seat = v[-3..].gsub("R", "1").gsub("L", "0").to_i(2)

  return [row, seat, 8*row + seat]
end

#test_values.each do |k, v|
#  row, seat, id = calc_seat(k)
#  puts row == v[0] && seat == v[1] && id == v[2]
#end

seats = []
File.foreach("input.txt") do |line|
  row, seat, id = calc_seat(line.strip)
  seats << id
end

puts seats.max
seats.sort!

(seats.count - 1).times do |i|
  next if i == 0
  if seats[i-1] != (seats[i] - 1)
    puts seats[i] - 1
  end
end
