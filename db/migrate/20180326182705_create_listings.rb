class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.integer :price
      t.text :description
      t.string :author
      t.references :user, foreign_key: true
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
