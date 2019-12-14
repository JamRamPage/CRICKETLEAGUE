# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
ruby 2.5.1, rails 5.2.3

* System dependencies

* Configuration

* Database creation
run rake db:setup

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
#THE DATABASE: (words in CAPS represent models)
The app stores details about a cricket league of TEAMS, ordered by the points they have scored (2 points for a win, 1 point for a draw or no-result (abandoned game), and no points for a loss).

The league is composed of MATCHES between two TEAMS of PLAYERS which may change over time, as the captain can select different squads for each MATCH. The MATCHES are held on a certain date (which may be in the future), at a certain stadium with a home and away TEAM. Each TEAM will bat up to a certain number of overs in each of their INNINGS' (each team gets one INNINGS per match):

In each INNINGS, up to 11 players from the team batting, may bat in a BATTING INNINGS, where they score a certain number of runs, in a certain number of balls/deliveries faced. They will hit a certain number of balls for a 4 or a 6, and can get out in a number of ways, involving the bowler/certain fielder/s. The BATTING INNINGS is therefore linked to an INNINGS that it was played in, a PLAYER, who batted, and up to two other PLAYERS on the opposing team who might have got the batsman out.

(Note, details of each BATTING INNINGS is shown in the scorecard on the match show view)

  Also, in each INNINGS, a certain number of players (usually about 5, will bowl in a BOWLING INNINGS. They bowl a set number of overs, concede a certain number of runs, take a certain number of wickets, and bowl some extras (no balls and wides, which add to the run total of the opposing team)).

A TEAM's score in a MATCH is comprised of the total runs achieved in all of their BATTING INNINGS', plus any no balls or wides conceded by the opposing team's bowlers in their BOWLING INNINGS', plus any miscellaneous extras, (byes, leg byes and penalty runs), which are not counted towards the batsman's total, and nor are counted against the bowler.

#SCORECARD:
  #Batting inningses:
Batsman: Name of the batsman

How out: (How they got out, eg c Jos Buttler b Chris Woakes     would mean the batsman was caught by Jos Buttler off the bowling of Chris Woakes).

Runs: (How many runs they scored directly)

Balls: (How many deliveries they faced)

4s: How many balls they hit for 4

6s: How many balls they hit for 6

Strike Rate: (Runs) / (Balls), so a strike rate of 100 would mean for every delivery the batsman faced, they scored on average 1 run.

RR: run rate (i.e. Runs scored per over)

Overs: (How many overs the batsmen faced in total (an over is comprised of 6 deliveries.))

Total score: e.g. 337/7 means that the batting side conceded 7 wickets, but scored 337 in total (batted runs + extras)

  #Bowling inningses:
Bowler: Name of the Bowler

Overs: How many overs they bowled (sets of 6 deliveries)

Maidens: How many overs they bowled IN WHICH THEY CONCEDED NO RUNS.

Runs: How many runs they conceded

Wickets: How many batsmen they got out (note, certain ways of getting a batsman out do not involve a bowler, so these would not be added to the bowler's total wickets, so the total wickets taken by all bowlers is not necessarily equal to the total wickets conceded by the batsmen).

Economy: Similar to Strike rate, this is the runs conceded / the overs faced.

No balls and Wides: Number of these extras conceded
