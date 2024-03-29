Redmine::Plugin.register :redmine_custom_fields_projects_default do
  name 'Redmine Custom Fields Projects Default plugin'
  author 'Andriy Malakhivskyy'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/andrijmalah/redmine_custom_fields_projects_default'
  author_url 'https://github.com/andrijmalah'

  project_module :redmine_custom_fields_projects_default do
    permission :edit_custom_fields_project_default_settings, { edit_custom_fields_project_default_settings: [:edit, :index] }
  end
end

Rails.application.config.to_prepare do
  require_dependency 'redmine_custom_fields_projects_default/project_patch'
  require_dependency 'redmine_custom_fields_projects_default/projects_helper_patch'
  require_dependency 'redmine_custom_fields_projects_default/timelog_helper_patch'
  require_dependency 'redmine_custom_fields_projects_default/timelog_controller_patch'
  require_dependency 'redmine_custom_fields_projects_default/custom_field_path'
  require_dependency 'redmine_custom_fields_projects_default/view_time_log_hook'
end
