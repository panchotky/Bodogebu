class ChangeDataIntroduceToUser < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :introduce, :string
  end
end
