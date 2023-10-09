require_relative 'student'

class StudentApp
  def create_student(people)
    puts
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Has parent permission? [Y/N]: '
    has_parent_permission = gets.chomp.upcase

    parent_permission = case has_parent_permission
                        when 'Y' then true
                        when 'N' then false
                        else
                          puts 'Option invalid, please try again'
                          return
                        end

    student = Student.new(age, nil, name, parent_permission: parent_permission)
    people << student
    puts 'Student created successfully.'
    puts
  end
end
