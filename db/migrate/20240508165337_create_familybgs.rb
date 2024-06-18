class CreateFamilybgs < ActiveRecord::Migration[7.0]
  def change
    create_table :familybgs do |t|
      t.string :father
      t.string :fatherwork
      t.string :solofather
      t.string :mother
      t.string :motherwork
      t.string :solomother
      t.integer :familymemberno
      t.integer :bother
      t.integer :sister

      t.timestamps
    end
  end
end
