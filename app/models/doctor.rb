class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :answers, dependent: :destroy
  has_many :users,  through: :answers
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true
  validates :speciality, presence: true

  SPECIALITY = {'dentistry' => 'Dentistry', 'medical psychology' => 'Medical Psychology','pediatrics' => 'Pediatrics'};
end
