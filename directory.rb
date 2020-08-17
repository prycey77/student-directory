student_count = 4
# first we print the list of students
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Norman Bates"
]
def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end
def print(names)
  names.each do |student|
  puts student
  end
end
def print_footer(names)
puts "Overall we have #{names.length} great students"
end

print_header
print(students)
print_footer(students)
