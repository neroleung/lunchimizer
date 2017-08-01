class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.timestamps null: false
      t.string :name, null: false
      t.index :name, unique: true
    end
  end
end
