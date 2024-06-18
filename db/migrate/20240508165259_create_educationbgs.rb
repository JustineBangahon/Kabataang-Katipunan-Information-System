class CreateEducationbgs < ActiveRecord::Migration[7.0]
  def change
    create_table :educationbgs do |t|
      t.string :hea
      t.string :elementary
      t.string :highschool
      t.string :college
      t.string :course
      t.string :educationstatus
      t.text :ifoutofschool

      t.timestamps
    end
  end
end
