require 'date'
# Clase de cursos
class Course
  def initialize(name, *dates)
    @name = name
    @start = Date.parse(dates[0])
    @finish = Date.parse(dates[1])
  end

  def earlier_dates(date_arg)
    puts("Curso comenzado previamente: #{@name}") if @start < date_arg
    is_2019?(date_arg)
  end

  def later_dates(date_arg)
    puts("Curso por finalizar más adelante: #{@name}") if @finish > date_arg
    is_2019?(date_arg)
  end
end
def is_2019?(date)
  if date >= Date.new(2019, 1, 1)
    puts 'ERROR: Fecha entregada es igual/mayor a 2019-01-01'
    true
  else
    false
  end
end
@each_course = []
@file = []
File.open('cursos.txt', 'r') { |data| @file = data.readlines }
@ls = []
@file.each do |i|
  @ls = i.split(', ').map(&:chomp)
  @each_course << Course.new(*@ls)
end
@each_course.each do |i|
  i.later_dates(Date.today)
end
@each_course.each do |i|
  i.earlier_dates(Date.today)
end
