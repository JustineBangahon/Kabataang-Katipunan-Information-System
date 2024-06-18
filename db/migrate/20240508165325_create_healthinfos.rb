class CreateHealthinfos < ActiveRecord::Migration[7.0]
  def change
    create_table :healthinfos do |t|
      t.string :disabilities
      t.string :medicalcondition

      t.timestamps
    end
  end
end
