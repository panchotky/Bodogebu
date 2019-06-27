class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :name
      t.integer :min_player
      t.integer :max_player
      t.integer :time
      t.string :image_id
      t.boolean :team, default: false

      t.timestamps
    end
  end
end
