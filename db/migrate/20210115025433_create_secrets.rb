class CreateSecrets < ActiveRecord::Migration[6.0]
  def change
    create_table :secrets do |t|
      t.string :title
      t.string :content
      t.integer :likes

      t.timestamps
    end
  end
end
