class ChangeTableNames < ActiveRecord::Migration
  def change
    rename_table :image, :images
    rename_table :caption, :captions

  end
end
