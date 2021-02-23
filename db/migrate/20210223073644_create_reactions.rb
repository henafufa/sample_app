class CreateReactions < ActiveRecord::Migration[6.1]
  def change
    create_table :reactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :micropost, null: false, foreign_key: true

      t.timestamps
    end
    # add_index :microposts, :user_id
    # add_index :microposts, :micropost_id
    add_index :reactions, [:user_id, :micropost_id, :created_at]
  end
end
