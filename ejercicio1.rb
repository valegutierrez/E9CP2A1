# Clase mesas
class Table
  attr_reader :name
  def initialize(name, *incomes)
    @name = name
    @incomes = incomes.map(&:to_i)
  end

  def highest_income
    puts "Recaudación máxima #{@name}:
    Día #{@incomes.index(@incomes.max)+1} : #{@incomes.max}"
  end

  def average
    @incomes.inject(&:+) / @incomes.length.to_f
  end
end

def tables_averages(*num)
  @result = (num.flatten.inject(&:+) / num.flatten.length.to_f)
  puts "Promedio de recaudación entre mesas: #{@result}"
end
@each_table = []
@file = []
File.open('casino.txt', 'r') { |data| @file = data.readlines }
@ls = []
@file.each do |i|
  @ls = i.split(', ').map(&:chomp)
  @each_table << Table.new(*@ls)
end
@each_table.each(&:highest_income)
@arr = []
@each_table.each do |i|
  @arr << i.average
end
tables_averages(@arr)
