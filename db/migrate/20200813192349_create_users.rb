class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :handle
      t.string :bio
      t.date :birthday

      t.timestamps
    end
  end
end
