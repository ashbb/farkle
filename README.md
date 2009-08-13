Farkle on Shoes: Simple Dice Game with Shoes
============================================

I heard **Farkle** from [kotp](http://github.com/kotp/kotp.github.com/tree/master) a few days ago.
I've never heard and never played. But after a little bit googling.
I became quite interested in that. So, I attempted to write a tiny Ruby code as Shoes app. ;-)


Usage
-----

- download `farkle_shoes.rb` and `farkle_shoes_module.rb` under the same directory.
- execute `farkle_shoes.rb` with Shoes.


Play
----

Look at [online demo](http://www.rin-shun.com/rubylearning/shoes/farkle_on_shoes.swf.html).   

You can manage the game session (navigation) by yourself.   
Also call it `have to`, though. :-P


Snapshot
--------
![farkle_on_shoes.png](http://github.com/ashbb/farkle/raw/master/farkle_on_shoes.png)


Game Rules
----------

Look at [this page](http://en.wikipedia.org/wiki/Farkle) on Wikipedia.


Scoring
-------

<pre>
Each 1     :  100 points
Each 5     :   50

Same Dice    Three    Four    Five    Six
  1s       : 1000     2000    3000    4000
  2s       :  200      400     600     800
  3s       :  300      600     900    1200
  4s       :  400      800    1200    1600
  5s       :  500     1000    1500    2000
  6s       :  600     1200    1800    2400

Straight   : 1500
Three Pairs:  750
</pre>


ToDoList
--------

- store log 
- support some restrictions for not breaking game rules
- automatic navigation
- play with computer


Change log
----------

Aug 12th, 2009: updated scoring rules v0.2
Aug 12th, 2009: first release v0.1


Have fun!
---------
 
ashbb


Note
----

- The CLI version is [here](http://github.com/ashbb/farkle/tree/master/cli_version.md). A bit old (It's my first step and no maintenance), though. :-P