require 'csv'
@students = []

def print_header
  puts 'The students of Villains Academy'
  puts '--------------------------------'
end

def print_students_list(students)
  students.each do |student|
    puts "#{student[0]} (#{student[1]} cohort)"
  end
end

def print_footer(names)
  puts "Overall we have #{names.length} great students"
end

def add_to_array(name)
@students << {name: name, cohort: :september }# cohort.to_sym}
end

def input_students
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
  # create an empty array
  # students = []
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    # @students << {name: name, cohort: :september}
    add_to_array(name)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
  @students
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file"
  puts "4. Load the list from file"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list(@students)
  print_footer(@students)
end

def process(selection, filename = "students.csv")
  case selection
  when "1"
    puts "1 selected" 
    input_students
  when "2"
    puts "2 selected"
    show_students
  when "3"
    puts "3 selected"
    save_students(filename)
  when "4"
    puts '4 selected'
    load_students
  when "9"
    puts '9 selected'
    exit #exit
  else
    puts "I don't know what you meant, try again"
  end
end

def load_students(filename = 'students.csv')
  @students = CSV.read(filename)
  p @students
  #File.open(filename, "r") do |file|
  #  file.readlines.each do |line|
  #    name, cohort = line.chomp.split(",")
  #    add_to_array(name)
     
  #  end
 # end # file.close
end

def save_students(filename = 'students.csv')
  
  puts "Enter a filename to save to file: (or hit 'Enter' to use #{filename})"
  file_name = STDIN.gets.chomp
  file_name == "" ? file_name = filename : nil
  CSV.open(filename, "w") do |csv|
  #File.open(file_name, "w") do |file|
  # iterate over the array of students
  @students.each do |student|
  csv << [student[:name], student[:cohort]]
  end
  # csv_line = student_data.join(",")
   # file.puts csv_line
 # end#
  end #file.close
end

def try_load_students
  if ARGV.first == nil
    puts 'Hit "Enter" to load from "students.csv" or enter a new filename'
    file_name = STDIN.gets.chomp
    file_name == "" ? filename = 'students.csv' : filename = file_name
  else
    filename = ARGV.first
  end
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    create_file(filename) 
end
  
end

def create_file(filename)
  puts "#{filename} doesn't exist. Are you sure you want to create it? (y/n)"
  user_input = STDIN.gets.chomp
  if user_input.downcase == 'y'
    File.new(filename, "w")
  elsif user_input.downcase == 'n'
    exit
  else
    puts "Please enter 'y' or 'n'"
  end   
end  

try_load_students
interactive_menu


