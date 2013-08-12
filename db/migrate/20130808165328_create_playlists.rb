class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :name
      t.string :icon

      t.timestamps
    end
  end
end
