class CreateUserProviders < ActiveRecord::Migration
  def change
    create_table :user_providers do |t|
      t.integer :name
      t.text :uid
      t.text :token
      t.text :secret
      t.integer :user_id

      t.timestamps
    end
  end
end
