class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :answers, dependent: :destroy
  has_many :doctors, through: :answers
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, allow_nil: true }
  validates :password, format: { with: /\A\S{6,128}\z/, allow_nil: true }
end
