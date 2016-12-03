class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :user
      t.string :zipcode
      t.string :city
      t.string :street
      t.string :tel

      t.timestamps
    end

    add_index :addresses, :user_id
    add_foreign_key :addresses, :users
  end
end
