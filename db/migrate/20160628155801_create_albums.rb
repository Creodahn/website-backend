class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end

    add_reference :albums, :person, index: true
  end
end
