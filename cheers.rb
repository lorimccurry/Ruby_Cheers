puts "What's your name?"
name = gets.chomp.upcase.strip

while name == ""
  puts "Please enter your name"
  name = gets.chomp.upcase.strip
end

puts "Thanks, #{name}"

# loop_name = name.gsub(/\W+\s+-/, "")


anChars = ['A', 'E', 'I', 'O', 'F', 'X', 'H', 'L', 'M', 'N', 'R', 'S']

name.each_char do |char|
  unless anChars.include? char
    article = 'a'
  else
    article = 'an'
  end
 puts "Give me #{article}...#{char}"
end

name.capitalize!

puts "#{name}'s freakin awesome!"

