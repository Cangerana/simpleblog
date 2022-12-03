class CreateReaders < ActiveRecord::Migration[7.0]
  def change
    create_table :readers do |t|
      t.string :name, null: false, comment: 'Reader name'
      t.timestamp :last_access, comment: 'Last accessed time'

      t.timestamps
    end
  end
end
