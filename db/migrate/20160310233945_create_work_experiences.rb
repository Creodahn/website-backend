class CreateWorkExperiences < ActiveRecord::Migration
  def change
    create_table :work_experiences do |t|
      t.string :company
      t.string :url
      t.date :started
      t.date :ended
      t.text :description

      t.timestamps null: false
    end
  end
end
