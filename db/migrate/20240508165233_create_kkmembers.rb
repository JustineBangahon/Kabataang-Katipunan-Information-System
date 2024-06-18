class CreateKkmembers < ActiveRecord::Migration[7.0]
  def change
    create_table :kkmembers do |t|
      t.references :personalinfo, null: false, foreign_key: true
      t.references :educationbg, null: false, foreign_key: true
      t.references :familybg, null: false, foreign_key: true
      t.references :healthinfo, null: false, foreign_key: true
      t.references :workbg, null: false, foreign_key: true

      t.timestamps
    end
  end
end
