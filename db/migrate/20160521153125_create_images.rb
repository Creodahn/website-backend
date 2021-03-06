class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :file_name
      t.string :url
      t.text :description
      t.references :imagable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
