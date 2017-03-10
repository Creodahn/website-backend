class ChangePersonIdToUploaderIdOnImages < ActiveRecord::Migration
  def change
    rename_column :images, :person_id, :uploader_id
  end
end
