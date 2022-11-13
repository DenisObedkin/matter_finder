class CreateVersions < ActiveRecord::Migration[6.1]
  def change
    create_table :versions do |t|
      t.references :matter
      t.jsonb :version
      t.timestamps
    end
  end
end
