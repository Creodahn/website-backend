class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.decimal :years, :precision => 18, :scale => 2
      t.text :description
      t.string :color
      t.string :hover_color

      t.timestamps null: false
    end
  end
end
