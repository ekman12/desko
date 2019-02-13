class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :photo
      t.text :description
      t.text :location
      t.text :workhours
      t.boolean :kitchen
      t.integer :price

      t.timestamps
    end
  end
end
