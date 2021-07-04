class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string     :first_name, null: false
      t.string     :last_name,  null: false
      t.string     :email,      null: false, index: true
      t.string     :provider,   null: false
      t.string     :uid,        null: false
      t.string     :image

      t.timestamps          null: false
    end
  end
end
