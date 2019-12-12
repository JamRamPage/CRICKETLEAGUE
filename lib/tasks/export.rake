#Note, this cannot be done with Match or Player, because these contain date fields, which will not compile
#if put into db seed file from this script.
namespace :export do
  desc "Prints Team.all, Innings.all, BattingInnings.all and BowlingInnings.all from database."
  task :seeds_format => :environment do
    Team.order(:id).all.each do |team|
      puts "Team.create(#{team.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end
    Innings.order(:id).all.each do |innings|
      puts "Innings.create(#{innings.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end
    BattingInnings.order(:id).all.each do |batting_innings|
      puts "BattingInnings.create(#{batting_innings.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end
    BowlingInnings.order(:id).all.each do |bowling_innings|
      puts "BowlingInnings.create(#{bowling_innings.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end
  end
end
