class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.date :authenticated_at
      t.string :authentication_token

      t.timestamps null: false
    end

    add_reference :people, :user, index: true
  end
end
