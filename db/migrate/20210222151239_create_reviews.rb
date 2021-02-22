class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true
      t.string :landscape_rating
      t.integer :signage_rating
      t.integer :difficulty_rating

      t.timestamps
    end
  end
end
