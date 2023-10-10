class PeopleStorage
  def save_people(people)
    json_people = people.map do |person|
      data = {
        'name' => person.name,
        'age' => person.age,
        'type' => person.class.name,
      }

      if person.is_a?(Student)
        data['parent_permission'] = person.parent_permission
      elsif person.is_a?(Teacher)
        data['specialization'] = person.specialization
      end
      data
    end
    File.open('people.json', 'w') do |file|
      file.write(JSON.generate(json_people))
    end
  end

  def load_people(people)
    if File.exist?('people.json')
      people_data = JSON.parse(File.read('people.json'))
      people_data.each do |person|
        if person['type'] == 'Student'
          people << Student.new(person['age'], nil, person['name'], parent_permission: person['parent_permission'])
        elsif person['type'] == 'Teacher'
          people << Teacher.new(person['age'], person['specialization'], person['name'])
        end
      end
    end
  end

end