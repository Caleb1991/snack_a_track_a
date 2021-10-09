class CreateUsersSnacks < ActiveRecord::Migration[5.2]
  def change
    create_table :users_snacks do |t|
      t.references :user, foreign_key: true
      t.references :snack, foreign_key: true
      t.timestamps
    end
  end
end
