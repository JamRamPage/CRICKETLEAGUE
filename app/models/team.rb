class Team < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :won, numericality: {only_integer: true}
  validates :won, numericality: {greater_than_or_equal_to: 0}
  validates :drawn, numericality: {only_integer: true}
  validates :drawn, numericality: {greater_than_or_equal_to: 0}
  validates :lost, numericality: {only_integer: true}
  validates :lost, numericality: {greater_than_or_equal_to: 0}
  validates :noresult, numericality: {only_integer: true}
  validates :noresult, numericality: {greater_than_or_equal_to: 0}

  def score
    2 * won + drawn + noresult
  end
  def played
    won + drawn + lost + noresult
  end

#  has_many :matches, dependent: :destroy <- TODO: Should be this, fix later
  has_many :matches
  has_many :players, dependent: :destroy
end
