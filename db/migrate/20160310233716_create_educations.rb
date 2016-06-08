class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :school_name
      t.date :started
      t.date :graduated
      t.text :description

      t.timestamps null: false
    end
  end
end
