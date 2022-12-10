class AddColumnIsAdminToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_admin, :boolean, comment: 'Flag if a user is system Admin'
  end
end
