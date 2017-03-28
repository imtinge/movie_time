class Movie < ApplicationRecord
  has_many :favorite_relationships
  has_many :collectors, through: :favorite_relationships, source: :user
  has_many :reviews
  belongs_to :user

  def collected_by?(user)
    collectors.include?(user)
  end

  def collect!(user)
    collectors << user
  end
end
