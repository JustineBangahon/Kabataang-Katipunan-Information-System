class CreatePersonalinfos < ActiveRecord::Migration[7.0]
  def change
    create_table :personalinfos do |t|
      t.string :firstname
      t.string :lastname
      t.string :middlename
      t.integer :age
      t.string :sex
      t.date :birthdate
      t.string :civilstatus
      t.integer :contactno
      t.string :emailaddress
      t.string :purok
      t.string :address
      t.string :nationality
      t.string :registeredvoter
      t.string :organization

      t.timestamps
    end
  end
end
