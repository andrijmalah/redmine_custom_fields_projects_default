class CustomFieldsDefaultsController < ApplicationController
  layout 'admin'

  before_action :find_project

  def create
    # byebug
    @value = @project.build_custom_fields_default
    @value.attributes = project_field_params['custom_fields_default_attributes']
    if @value.save
      flash[:notice] = l(:notice_successful_update)
    end
    respond_to do |format|
      format.html { redirect_to :controller => 'projects', :action => 'settings', :id => @project, :tab => params[:tab] }
    end
  end

  # def destroy
  #   if @sla_timer_setting.destroy
  #     flash[:notice] = l(:notice_successful_delete)
  #   else
  #     flash[:error] = l(:notice_unsuccessful_save)
  #   end
  #   redirect_to :controller => 'projects', :action => 'settings', :id => @project, :tab => params[:tab]
  # end

  # def update
  #   new_attr = project_billing_params.to_hash || {}
  #   if @project.project_billing_setting
  #     byebug
  #     new_attr['project_billing_setting_attributes'][:id] = @project.project_billing_setting.id
  #   end

  #   if @project.update_attributes(new_attr)
  #     flash[:notice] = l(:notice_successful_update)
  #   end
  #   redirect_to :controller => 'projects', :action => 'settings', :id => @project, :tab => params[:tab]
  # end

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
