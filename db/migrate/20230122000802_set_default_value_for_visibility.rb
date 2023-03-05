class SetDefaultValueForVisibility < ActiveRecord::Migration[7.0]
  def change
    table_name = Post.table_name

    if table_exists?(table_name) and column_exists?(table_name, :visible)
      change_column table_name, :visible, :boolean, default: true, null: false,
                    comment: 'Flag of a post is visible for others users'
    end
  end
end

