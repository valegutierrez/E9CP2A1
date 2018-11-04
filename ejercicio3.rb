# Clase ruleta
class Roulette
  def initialize()
    @r = (1..10).to_a
  end

  def play(num)
    @bet = @r.sample
    puts @bet
    File.open('roulette_history.txt', 'a') { |file| file.puts(@bet) }
    File.open('winners.txt', 'a') { |file| file.puts(num) } if @bet == num
  end
end

def most_repeated
  @arr = []
  @counted = {}
  File.open('roulette_history.txt', 'r') { |file| @arr = file.readlines }
  @nums = @arr.map(&:chomp)
  @nums.each do |i|
    @counted[i.to_i] = @nums.count(i)
  end
  @max = @counted.max_by { |k, v| v }
  puts "Número más repetido: #{@max[0]}"
end
ruleta = Roulette.new
ruleta.play(5)
ruleta.play(10)
ruleta.play(7)
most_repeated
