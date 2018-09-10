require 'csv'

if ARGV[0]
  file_path = ARGV[0]
else
  print "Input the path : "
  file_path = gets.chomp
end

puts  #program start

#open the csv and sort it by id
csv = CSV.read(file_path)
csv = csv[1,csv.count-1].sort_by!{|i| i[0].to_i}
duplicated_array = Array.new

last_id = nil  #temp record
csv.each{
  |i|
  id = i[0].to_i
  if id != last_id
    last_id = id
  else
    duplicated_array.push(id)
  end
}

#print result
duplicated_array.each{
  |i|
  puts i
}

puts  #program end