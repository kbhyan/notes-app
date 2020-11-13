class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.references :user
      t.string :title, null: false, index: true
      t.text :body, index: true
      t.string :tags, array: true, default: []

      t.timestamps
    end
  end
end
