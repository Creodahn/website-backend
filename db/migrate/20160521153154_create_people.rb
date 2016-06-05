class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :title
      t.date :birth_date
      t.text :description
      t.string :email
      t.string :location
      t.string :linkedin
      t.string :resume_url

      t.timestamps null: false
    end
  end
end
