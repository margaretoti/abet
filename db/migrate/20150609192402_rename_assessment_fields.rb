class RenameAssessmentFields < ActiveRecord::Migration[5.1]
  def change
    rename_column :direct_assessments, :assignment_name, :name
    rename_column :direct_assessments, :assignment_description, :description

    rename_column :indirect_assessments, :assessment_name, :name
    rename_column :indirect_assessments, :assessment_description, :description
  end
end
