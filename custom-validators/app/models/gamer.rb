class Gamer < ActiveRecord::Base
  has_many :games

  validates :games, association_length: { minimum: 1, maximum: 3 }

  accepts_nested_attributes_for :games, allow_destroy: true
end
