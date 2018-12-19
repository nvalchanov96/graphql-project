class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :text, null: false
      t.references :user, index: true, null: false
      t.timestamps
    end
  end
end
