Farkle: Simple Dice Game
========================

I heard **Farkle** from [kotp](http://github.com/kotp/kotp.github.com/tree/master) a few days ago.
I've never heard and never played. But after a little bit googling.
I became quite interested in that. So, I attempted to write a tiny Ruby code. ;-)


Usage
-----

- download `farkle.rb` and `player.rb` under the same directory.
- run `ruby farkle.rb` on the console. this is a CUI game.


Play
----

You can input nothing (but only `Enter`) or numbers after the prompt `> ` like this:

	>ruby farkle.rb
	player: ashbb
	total score: 0
	current score: 150
	dice: 6 5 1 3 4 4
	count: 1 0 1 2 1 1
	farkle: 0
	> 12
	player: ashbb
	total score: 0
	current score: 200
	dice: 4 5 1 2 3 5
	count: 1 1 1 1 2 0
	farkle: 0

**In the upper case:**

- Player `ashbb` thew six dice at a time and got `dice: 6 5 1 3 4 4`. This shows die0-6, die1-5, die2-1, die3-3, die4-4, die5-4.
- `count: 1 0 1 2 1 1` means 1-1, 2-0, 3-1, 4-2, 5-1, 6-1.
- Player's input `12` means that player held die1 and die2. 

**In the lower case:**

- Player thew four dice (die0, die3, die4, die5) and got `dice: 4 5 1 2 3 5`. die1 and die2 are hold. Only die0 and die3-die5 were rolled.


** Hot Dice! and Farkle!:**

- If the player has scored all six dice, they have "hot dice" and may continue their turn with a new throw of all six dice, adding to the score they have already accumulated.

- If none of the dice score in any given throw, the player has "farkled" and all points for that turn are lost.

Quoted this from Wikipedia. Look at [this](http://en.wikipedia.org/wiki/Farkle) for more information.


Scoring
-------

<pre>
Each 1   :  100
Each 5   :   50
Three 1s : 1000
Three 2s :  200
Three 3s :  300
Three 4s :  400
Three 5s :  500
Three 6s :  600
</pre>


Sample Logs
-----------

- [log1](http://github.com/ashbb/farkle/tree/master/log/log1.txt) : farkle! hot dice! Invalid input.
- [log2](http://github.com/ashbb/farkle/tree/master/log/log2.txt) : over 1000 score
- [log3](http://github.com/ashbb/farkle/tree/master/log/log3.txt) : after 3 times farkle


ToDoList
--------

- add more rules
- creat GUI version with Shoes


Have fun!
---------
 
ashbb

