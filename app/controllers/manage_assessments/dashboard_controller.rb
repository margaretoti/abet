class ManageAssessments::DashboardController < ApplicationController
  def show
    @courses = policy_scope(Course)
    authorize(:generic, :create_assessments?)
  end
end