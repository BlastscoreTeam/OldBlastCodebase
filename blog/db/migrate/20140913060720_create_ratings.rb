class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :movie
      t.float :rating

      t.timestamps
    end
  end
end
