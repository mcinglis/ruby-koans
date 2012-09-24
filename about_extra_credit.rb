# EXTRA CREDIT:
#
# Create a program that will play the Greed Game.
# Rules for the game are in GREED_RULES.TXT.
#
# You already have a DiceSet class and score function you can use.
# Write a player class and a Game class to complete the project.  This
# is a free form assignment, so approach it however you desire.

def roll(n)
  (1..6).to_a.sample(n)
end

def score(dice)
  (1..6).map do |result|
    count = dice.count(result)
    case result
    when 1 then (1000 * (count / 3)) + (100 * (count % 3))
    when 5 then (500 * (count / 3)) + (50 * (count % 3))
    else 100 * result * (count / 3)
    end
  end.reduce(:+)
end

def play(n)
end

