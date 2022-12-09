class AddColumnUserIdToAuthor < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :user_id, :integer, comment: 'Fk to user table'
  end
end
