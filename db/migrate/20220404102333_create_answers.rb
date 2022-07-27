class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.references :doctor, foreign_key: true
      t.references :user, foreign_key: true
      t.text :description
      t.date :answer_date
      t.datetime :start_time
      t.datetime :end_time
      
      t.timestamps
    end
    add_index :answers, [:doctor_id, :user_id, :answer_date, :start_time, :end_time], unique: true, name: "appoinments_index_with_patient"
  end
end
