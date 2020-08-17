student_count = 4
# first we print the list of students
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Norman Bates"
]

puts "The students of Villains Academy"
puts "--------------------------------"
students.each do |student|
  puts student
end
puts "Overall we have #{students.length} great students"
