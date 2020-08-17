student_count = 4
# first we print the list of students
students = [
  {name: "Dr. Hannibal Lecter", cohort: :september},
  {name: "Darth Vader", cohort: :september},
  {name: "Nurse Ratched", cohort: :september},
  {name: "Norman Bates", cohort: :september}
]
def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end
def print(students)
  students.each do |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end
def print_footer(names)
puts "Overall we have #{names.length} great students"
end

print_header
print(students)
print_footer(students)
