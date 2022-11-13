class CreateMatters < ActiveRecord::Migration[6.1]
  def change
    create_table :matters do |t|
      t.string :code, null: false, default: 'DTSZN', index: true
      t.string :title, null: false, index: true
      t.text :text, null: false
      t.string :author, null: false, index: true
      t.timestamps
    end
  end
end
