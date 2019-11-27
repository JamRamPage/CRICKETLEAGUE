json.extract! batting_innings, :id, :Innings_id, :Player_id, :batsman_number, :runs, :balls, :fours, :sixes, :howout, :bowler_id, :fielder_id, :created_at, :updated_at
json.url batting_innings_url(batting_innings, format: :json)
