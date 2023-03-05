class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false, comment: 'Title of post'
      t.text :content, null: false, comment: 'Post content'
      t.boolean :visible, comment: 'Flag of a post is visible for others users'
      t.integer :author_id, null: false, comment: 'FK to authors table'
      t.integer :tag_id, null: false, comment: 'FK to tags table'

      t.timestamps
    end
  end
end

