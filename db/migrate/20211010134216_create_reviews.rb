class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :description
      t.float :rating
      t.references :users_snack, foreign_key: true
      t.timestamps
    end
  end
end
