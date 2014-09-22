class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :format
      t.integer :length
      t.integer :year
      t.integer :rating
      t.references :collection, index: true

      t.timestamps
    end
  end
end
