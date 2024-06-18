class AddKkmemberRefToEducationbgs < ActiveRecord::Migration[6.0]
  def change
    add_reference :educationbgs, :kkmember, foreign_key: true
  end
end