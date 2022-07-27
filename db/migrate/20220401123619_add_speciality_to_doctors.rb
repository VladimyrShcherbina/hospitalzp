class AddSpecialityToDoctors < ActiveRecord::Migration[6.1]
  def change
    add_column :doctors, :name, :string
    add_column :doctors, :speciality, :string
  end
end
