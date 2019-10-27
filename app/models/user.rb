class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :registration_mail
  
  def registration_mail
    RegistrationMailer.registration_mail(self).deliver
  end

  has_many :assigned_works, dependent: :destroy
  has_many :shifts, through: :assigned_works, source: :shift
  has_many :comments
  has_many :request_shifts, dependent: :destroy
end
