class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.date :started
      t.date :ended
      t.text :description
      t.string :url

      t.timestamps null: false
    end
  end
end
