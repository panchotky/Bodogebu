class AddDefaultIntroduceToUser < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :introduce, :text, :default => "紹介文はまだ入力されていません。"
  end
end
