class CreatePhysicians < ActiveRecord::Migration[6.1]
  def change
    create_table :physicians do |t|
      t.string :name
      t.string :speciality
      t.string :hospital
      t.text :education
      t.string :years_in_practice

      t.timestamps
    end
  end
end
