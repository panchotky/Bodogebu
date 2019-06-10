class AddPlayerToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :player, :integer
  end
end
