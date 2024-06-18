class AddWorkbgToKkmembers < ActiveRecord::Migration[7.0]
  def change
    add_reference :kkmembers, :workbg, null: false, foreign_key: true
  end
end
