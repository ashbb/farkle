# player.rb
class Player
  SCORE_THREE = [1000, 200, 300, 400, 500, 600]
  SCORE_SIX = SCORE_THREE.collect{|n| n * 2}
  SCORE_EACH = [100, 0, 0, 0, 50, 0]
  
  def initialize name
    @name, @total_score, @farkles = name, 0, 0
    @dice, @counts, @holds = [], [], []
  end
  
  attr_reader :name, :total_score, :farkles
  
  def init
    @finish = false
    6.times{|n| @holds[n] = false}
  end
  
  def finish?
    @finish or @farkles == 3
  end
  
  def throw
    6.times{|i| @dice[i] = rand(6) unless @holds[i]}
    @current_score, @hot_dice, @counts = calculate @dice
    case
      when farkled? : farkle
      when @hot_dice : hot_dice
      else
        show
        print '> '
        (holds = gets.strip).empty? ? pass : hold(holds)
    end
  end

  def farkled?
    dice = []
    6.times{|i| dice[i] = @holds[i] ? -1 : @dice[i]}
    score, = calculate dice
    score.zero?
  end
  
  def farkle
    @farkles += 1
    @finish, @current_score = true, 0
    $players_num -= 1 if @farkle == 3 && !$achieved
    show
    puts "Oops, farkled!\n\n"
  end
  
  def hot_dice
    @total_score += @current_score
    check_total_score
    show
    puts "Yay, hot dice!\n\n"
    init
  end
  
  def pass
    @total_score += @current_score
    check_total_score
    @finish = true
    puts "total score: #{@total_score}\n\n"
  end
  
  def hold holds
    holds = holds.split('').collect{|e| e.to_i}
    if valid?(holds)
      6.times{|n| @holds[n] = false}
      holds.each{|n| @holds[n] = true}
      throw
    else
      puts "Invalid input. Passed.\n\n"
      pass
    end
  end
  
  def valid?(holds)
    dice = Array.new(6){-1}
    holds.each{|n| dice[n] = @dice[n]}
    score, valid, = calculate dice
    valid
  end
  
  def check_total_score
    $achieved = true if @total_score > 1000
  end

  def show
    puts "player: #{@name}"
    puts "total score: #{@total_score}"
    puts "current score: #{@current_score}"
    puts "dice: #{@dice.collect{|n| n+1}.join(' ')}"
    puts "count: #{@counts.join(' ')}"
    puts "farkle: #{@farkles}"
  end
  
  def calculate dice
    counts = Array.new(6){0}
    dice.each{|n| counts[n] += 1 unless n == -1}
    current_score, hot_dice = 0, true
    counts.each_with_index do |n, i|
      score = case n
        when 6 : SCORE_SIX[i]
        when 5 : SCORE_THREE[i] + SCORE_EACH[i] * 2
        when 4 : SCORE_THREE[i] + SCORE_EACH[i]
        when 3 : SCORE_THREE[i]
        when 2 : SCORE_EACH[i] * 2
        when 1 : SCORE_EACH[i]
        else
          0
      end
      current_score += score
      hot_dice = false if n != 0 && score == 0
    end
    return current_score, hot_dice, counts
  end
end
