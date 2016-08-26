class CreateUsers < ActiveRecord::Migration[5.0]
  def up
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :authentication_token

      t.timestamps
    end
    add_index  :users, :authentication_token, unique: true
  end
  def down
  	drop_table :users
  end
end
