class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :photo
      t.text :description
      t.string :location
      t.string :workhours
      t.boolean :kitchen
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
