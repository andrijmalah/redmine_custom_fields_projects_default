class CustomFieldsDefaultsController < ApplicationController
  layout 'admin'

  before_action :find_project

  def create
    @value = @project.build_custom_fields_default
    @value.attributes = project_field_params['custom_fields_default_attributes']
    flash[:notice] = l(:notice_successful_update) if @value.save
    respond_to do |format|
      format.html { redirect_to controller: 'projects', action: 'settings', id: @project, tab: params[:tab] }
    end
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def project_field_params
    params.require(:project).permit(
      custom_fields_default_attributes: [:id, :project_id, :custom_field_id, :value]
    )
  end
end
