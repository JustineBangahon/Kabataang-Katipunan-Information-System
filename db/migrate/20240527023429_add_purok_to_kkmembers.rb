class AddPurokToKkmembers < ActiveRecord::Migration[7.0]
  def change
    add_reference :kkmembers, :purok, null: false, foreign_key: true
  end
end
