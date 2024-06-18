class CreatePuroks < ActiveRecord::Migration[7.0]
  def change
    create_table :puroks do |t|
      t.string :purokname

      t.timestamps
    end
  end
end
