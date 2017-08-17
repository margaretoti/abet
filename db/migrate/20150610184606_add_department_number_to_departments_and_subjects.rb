class AddDepartmentNumberToDepartmentsAndSubjects < ActiveRecord::Migration[5.1]
  def change
    add_column :departments, :number, :integer, null: false
    add_index :departments, :number, unique: true

    add_column :subjects, :department_number, :integer, null: false
    add_index :subjects, :department_number
  end
end
