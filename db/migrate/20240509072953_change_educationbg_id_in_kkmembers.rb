class ChangeEducationbgIdInKkmembers < ActiveRecord::Migration[6.0]
  def change
    change_column_null :kkmembers, :educationbg_id, true
  end
end