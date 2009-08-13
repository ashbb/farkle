# farkle_shoes_module.rb
module Farkle
  SCORE_THREE = [1000, 200, 300, 400, 500, 600]
  SCORE_SIX = SCORE_THREE.collect{|n| n * 2}
  SCORE_EACH = [100, 0, 0, 0, 50, 0]

  POS = [[[11, 11]], [[11, 5], [11, 18]], [[4, 4],[12, 12],[20, 20]],
         [[6, 6],[18, 6],[6, 18],[18, 18]], 
         [[4, 4],[19, 4],[12, 12],[4, 19],[20, 20]], 
         [[6, 3],[6, 12],[6, 21],[18, 3],[18, 12],[18, 21]]]
         
  def init
    @dice, @holds = Array.new(6){rand(6)}, Array.new(6){false}
  end
  
  def hold
    @upper_dice.each_with_index{|die, i| @dice[i] = rand(6) unless die.hidden}
    @lower_dice.each_with_index{|die, i| @holds[i] = true unless die.hidden}
    @ptbs[2].text = (@ptbs[2].text.to_i + @ptbs[3].text.to_i ).to_s
    @ptbs[3].text = '0'
  end
  
  def roll
    @go_on = @go_on ? hold : init
    
    @upper_dice, @upper_bgs, @upper_eyes = [], [], Array.new(6){Array.new}
    @lower_dice, @lower_bgs, @lower_eyes = [], [], Array.new(6){Array.new}
    @base.remove if @base
    @base = stack :width => 250, :height => 100
    
    @base.append do
      create_dice @upper_dice, @upper_bgs, @upper_eyes, 20, :upper
      create_dice @lower_dice, @lower_bgs, @lower_eyes, 60, :lower
    end
    
    6.times do |i|
      blk = lambda{@lower_dice[i].toggle; @upper_dice[i].toggle; report}
      @upper_dice[i].click &blk
      @lower_dice[i].click(&blk) if @lower_bgs[i].fill == white
    end
    
    farkle
    hotdice
  end
  
  def pass
    @ptbs[2].text = (@ptbs[2].text.to_i + @ptbs[3].text.to_i ).to_s
    @ptbs[1].text = (@ptbs[1].text.to_i + @ptbs[2].text.to_i ).to_s
    @ptbs[3].text = @ptbs[2].text = '0'
    @players.each_with_index do |player, i|
      @ts[i].text = @ptbs[1].text if player == @ptbs[0].text
    end
  end
  
  def check &blk
    dice = Array.new(6){-1}
    6.times{|i| dice[i] = @dice[i] unless blk[i]}
    calculate dice
  end
  
  def farkle
    score,  = check{|i| @holds[i]}
    if score.zero?
      @players.each_with_index do |player, i|
        (@fk[i].text += 'F') if player == @ptbs[0].text
      end
      @ptbs[2].text = @ptbs[3].text = 0
      @tt.text = 'Farkle!'; @tt.style :stroke => red
      @msg.show
      timer(5){@msg.hide}
    end
  end
  
  def hotdice
    score, hd, = check{|i| @holds[i]}
    if hd
      @tt.text = 'Hot Dice!'; @tt.style :stroke => blue
      @msg.show
      timer(5){@msg.hide}
    end
  end
  
  def create_dice dice, bgs, eyes, y, flag
    6.times do |i|
      dice << stack(:left => 20+38*i, :top => y, :width => 30, :height => 30){
        bgs << rect(0, 0, 30, 30, :fill => white, :curve => 6)
        j = @dice[i]
        POS[j].length.times do |n|
          eyes[i] << oval(POS[j][n][0], POS[j][n][1], 8)
        end
      }
      dice.last.hide if flag == :upper and @holds[i]
      dice.last.hide if flag == :lower and !@holds[i]
      bgs.last.fill = khaki if flag == :lower and @holds[i]
    end
  end
  
  def report
    score, valid, dice = check{|i| @holds[i] or @lower_dice[i].hidden}
    @ptbs[3].text = score.to_s
    color = valid ? black : red
    @lower_eyes.each_with_index do |eyes, i|
      eyes.each{|o| o.style :fill => color} unless dice[i] == -1
    end
  end
  
  def calculate dice
    counts = Array.new(6){0}
    dice.each{|n| counts[n] += 1 unless n == -1}
    score, hot_dice = 0, true
    counts.each_with_index do |n, i|
      tmp = case n
        when 6 : SCORE_SIX[i]
        when 5 : SCORE_THREE[i] + SCORE_EACH[i] * 2
        when 4 : SCORE_THREE[i] + SCORE_EACH[i]
        when 3 : SCORE_THREE[i]
        when 2 : SCORE_EACH[i] * 2
        when 1 : SCORE_EACH[i]
        else
          0
      end
      score += tmp
      hot_dice = false if n != 0 && tmp == 0
    end
    return score, hot_dice, dice
  end
end
