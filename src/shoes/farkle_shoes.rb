# farkle_shoes.rb
require 'farkle_shoes_module'

Shoes.app :width => 360, :height => 320, :title => 'Farkle v0.2' do
  extend Farkle
  style Link, :stroke => white, :underline => nil, :weight => 'bold'
  style LinkHover, :stroke => gold, :fill => nil, :underline => nil
  style Para, :stroke => white, :weight => 'bold' 
  nostroke
  background forestgreen
  
  @ptbs, @ts, @fk = [], [], []
  
  para link('ROLL'){roll unless @go_on.nil? or (0..5).
    collect{|i| @lower_eyes[i][0].style[:fill] == red and !@lower_dice[i].hidden}.any?
  }, :left => 20, :top => 100
  para link('PASS'){pass}, :left => 100, :top => 100
  
  %w[P T B S].each_with_index do |e, i|
    para(e, :left => 250, :top => 30 + 20 * i)
    @ptbs << para('', :left => 270, :top => 30 + 20 * i)
  end
  
  line 10, 130, 350, 130, :stroke => white
  para 'Player               Total Score        Farkles', 
    :left => 20, :top => 150, :stroke => gold
  
  @players = %w[Vic Willian Leticia ashbb]
  
  @players.each_with_index do |player, i|
    para link(player){
      @ptbs[0].text = player; @ptbs[0].stroke = crimson
      @ptbs[1].text = @ts[i].text
      @ptbs[2].text = @ptbs[3].text = '0'
      @go_on = false; roll
    }, :left => 20, :top => 180 + 30 * i
    @ts << para('0', :left => 130, :top => 180 + 30 * i)
    @fk << para('', :left => 250, :top => 180 + 30 * i)
  end
  
  @msg = flow :left => 50, :top => 100, :width => 250, :height => 70 do
    background rgb(255, 140, 0, 0.7), :curve => 10
    @tt = title '', :weight => 'bold', :align => 'center'
  end.hide
end
