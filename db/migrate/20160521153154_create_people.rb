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
      t.string :login_key
      t.string :token
      t.string :password_digest

      t.timestamps null: false
    end

    add_index :people, :email, unique: true
  end
end
