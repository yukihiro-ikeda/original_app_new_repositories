class User < ApplicationRecord
  validates :email, presence: true
  has_many :teams, foreign_key: :owner_id
  has_many :assigns
  has_many :assign_teams, through: :assigns, source: :team
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
