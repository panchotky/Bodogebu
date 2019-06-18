class AddImaginationToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :imagination, :integer
  end
end
