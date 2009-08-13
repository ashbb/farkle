*OMG! I'd misunderstood the game rules. Will have to correct asap. Please give me some time.*  ==> **Fixed!** :-D

Farkle: Simple Dice Game
========================

I heard **Farkle** from [kotp](http://github.com/kotp/kotp.github.com/tree/master) a few days ago.
I've never heard and never played. But after a little bit googling.
I became quite interested in that. So, I attempted to write a tiny Ruby code. ;-)


Usage
-----

- download `farkle.rb` and `player.rb` under the same directory.
- run `ruby farkle.rb` on the console. this is a CLI game.


Play
----

You can input nothing (but only `Enter`) or numbers after the prompt `> ` like this:

	>ruby farkle.rb
	**New Turn Start!**
	player: ashbb
	total score: 0
	hold score: 0
	roll score: 200
	dice: 5 5 3 2 2 1
	count: 1 2 1 0 2 0
	farkle: 0
	> 015
	player: ashbb
	total score: 0
	hold score: 200
	roll score: 50
	dice: 0 0 5 2 6 0
	count: 0 1 0 0 1 1
	farkle: 0
	> 

**In the upper case:**

- Player `ashbb` thew six dice at a time and got `dice: 5 5 3 2 2 1`. This shows die0-5, die1-5, die2-3, die3-2, die4-2, die5-1.
- `count: 1 2 1 0 2 0` means 1-1, 2-2, 3-1, 4-0, 5-2, 6-0.
- Player's input `015` means that player held die0, die1 and die5. 

**In the lower case:**

- Player thew three dice (die2, die3, die4) and got `dice: 5 2 6`. die0, die1 and die5 are hold. Only die2-die4 were rolled.


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

- [log1](http://github.com/ashbb/farkle/tree/master/log/log1.txt) : Hot Dice!
- [log2](http://github.com/ashbb/farkle/tree/master/log/log2.txt) : Invalid input. Farkle!
- [log3](http://github.com/ashbb/farkle/tree/master/log/log3.txt) : after 3 Farkles


ToDoList
--------

- add more rules
- creat GUI version with Shoes


Have fun!
---------
 
ashbb

