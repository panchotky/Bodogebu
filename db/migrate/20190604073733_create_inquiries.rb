class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.boolean :check, default: false

      t.timestamps
    end
  end
end
