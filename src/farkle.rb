# farkle.rb
# Farkle: Simple Dice Game v0.1
STDOUT.sync = true
require 'player'

names = %w[ashbb computer Vic]
$players_num, $achieved = names.length, false
players = Array.new($players_num){Player.new names.shift}

players.each do |player|
    $players_num -= 1 if $achieved
    break if $players_num.zero?
    player.init
    player.throw until player.finish?
end until $players_num.zero?
  
results = players.collect{|player| [player.name, player.total_score, player.farkles]}.
  sort_by{|e| e[1]}.reverse
puts "winner: #{results.first[0]}"
puts results.collect{|name, score, farkles| "#{name} : #{score} : #{'F'*farkles}"}
puts
puts 'Thanks for playing. See you!'
