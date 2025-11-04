class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  validates :email, uniqueness: true, presence: true

  validates :password, presence: true

  has_many :posts
  # has_many :comments
end
