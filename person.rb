# This class stores information about people.
class Person
  attr_accessor :name, :age, :gender

  # Create the person object and store their name
  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end

  # Print this person's name to the screen
  def print_name
    puts "Person called #{@name}"
  end
end

me = Person.new("Collin", 36, "male")
olive = Person.new("Olive", 6, "female")

require "pstore"

store = PStore.new("safestorage")
store.transaction do
  store[:people] ||= Array.new
  store[:people] << me
  store[:people] << olive
end

people = []
store.transaction do
  people = store[:people]
end

store.transaction do
  people[0].name = "Bob"
  store[:people] << people
end

people.each do |person|
  p person.name
end
