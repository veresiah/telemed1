class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :age
      t.string :gender
      t.text :medical_conditions
      t.string :primary_care
      t.string :insurance

      t.timestamps
    end
  end
end
