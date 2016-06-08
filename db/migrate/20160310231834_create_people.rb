class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.integer :age
      t.text :description
      t.text :email

      t.timestamps null: false
    end
  end
end
