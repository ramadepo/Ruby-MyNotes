#the Hash
puts
print "Hash : \n\n"

What = {
    "TW" => "Taiwan",
    12345 => "Number",
    :www => "One"
}

puts What["TW"]
puts What[12345]
puts What[:www]
What[:qq] = "55555"
puts What[:qq]

puts