class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :key
      t.string :artist
      t.string :name
      t.string :icon
      t.references :playlist, index: true

      t.timestamps
    end
  end
end
