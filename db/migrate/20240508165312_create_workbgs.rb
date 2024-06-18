class CreateWorkbgs < ActiveRecord::Migration[7.0]
  def change
    create_table :workbgs do |t|
      t.string :work
      t.string :agency

      t.timestamps
    end
  end
end
