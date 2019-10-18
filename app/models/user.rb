class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :assigned_works
  has_many :shifts, through: :assigned_works, source: :shift
  has_many :comments
  has_many :rquest_shifts
end
