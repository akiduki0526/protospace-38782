class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      #t.string :email,              null: false, default: ""
      #t.string :encrypted_password, null: false, default: ""
      t.string :name
      t.text :profile
      t.text :occupation
      t.text :position

      t.timestamps
    end
  end
end
