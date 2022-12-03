class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name, null: false, comment: 'Author name'
      t.string :site, comment: 'Site of author'
      t.string :email, comment: 'E-mail of author'
      t.timestamp :last_access, comment: 'Last accessed time'
      t.text :profile, comment: 'Description of author'

      t.timestamps
    end
  end
end
