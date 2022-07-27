class Answer < ApplicationRecord
  belongs_to :doctor
  belongs_to :user

  validates :description, presence: true, length: { in: 10..300 }
  validates :answer_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  
  scope :create_scope, -> { order(created_at: :desc) } 
  scope :update_scope, -> { order(updated_at: :desc) } 
end
