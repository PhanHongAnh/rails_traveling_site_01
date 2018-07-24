class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.boolean :is_admin
      t.string :email
      t.boolean :is_actived
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
