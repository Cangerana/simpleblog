class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :name, null: false, comment: 'Tag name'

      t.timestamps
    end
  end
end
