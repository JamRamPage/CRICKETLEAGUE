json.extract! team, :id, :name, :won, :drawn, :lost, :noresult, :created_at, :updated_at
json.url team_url(team, format: :json)
