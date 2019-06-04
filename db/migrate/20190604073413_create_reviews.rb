class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :game_id
      t.integer :user_id
      t.integer :recommend
      t.integer :strategy
      t.integer :luck
      t.integer :memory
      t.integer :talk
      t.integer :quick
      t.integer :psychology
      t.integer :play_time
      t.text :comment
      t.boolean :favorite, default: false

      t.timestamps
    end
  end
end
