[![Build Status](https://travis-ci.org/pelensky/ttt_cli.svg?branch=master)](https://travis-ci.org/pelensky/ttt_cli)
[![Coverage Status](https://coveralls.io/repos/github/pelensky/ttt_cli/badge.svg?branch=master)](https://coveralls.io/github/pelensky/ttt_cli?branch=master)
# Tic Tac Toe Command Line Interface Gem

This is a command line front end Tic Tac Toe game built in Ruby. It will uses my [ttt_core](www.github.com/pelensky/ttt_core) gem.

#### Running instructions
1. Install the gem `gem install ttt_cli`
2. Run the game by running `ttt_cli`

#### The Rules

The rules of tic-tac-toe are as follows:

* There are two players in the game (X and O)
* Players take turns until the game is over
* A player can claim a field if it is not already taken
* A turn ends when a player claims a field
* A player wins if they claim all the fields in a row, column or diagonal
* A game is over if a player wins
* A game is over when all fields are taken
