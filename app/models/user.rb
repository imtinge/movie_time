class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :favorite_relationships
  has_many :favorites, through: :favorite_relationships, source: :movie
  has_many :reviews
  has_many :movies

  def is_favorite_of?(movie)
    favorites.include?(movie)
  end

  def collect!(movie)
    favorites << movie
  end
end
