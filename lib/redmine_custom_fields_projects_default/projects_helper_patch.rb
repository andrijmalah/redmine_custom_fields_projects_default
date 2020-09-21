require_dependency 'queries_helper'

module RedmineCustomFieldsProjectsDefault
  module ProjectsHelperPatch
    def self.included(base)
      base.send(:include, InstanceMethods)

      base.class_eval do
        # unloadable
        alias_method :project_settings_tabs_without_custom_fields_settings, :project_settings_tabs
        alias_method :project_settings_tabs, :project_settings_tabs_with_custom_fields_settings
      end
    end

    module InstanceMethods
      def project_settings_tabs_with_custom_fields_settings
        tabs = project_settings_tabs_without_custom_fields_settings
        if User.current.allowed_to?(:edit_custom_fields_project_default_settings, @project)
          tabs.push(
            name: 'custom_fields_default_settings',
            action: :edit_custom_fields_project_default_settings,
            partial: 'projects/custom_fields_deafult_settings',
            label: :custom_fields_settings
          )
        end
        tabs
      end
    end
  end
end
unless ProjectsHelper.included_modules.include?(RedmineCustomFieldsProjectsDefault::ProjectsHelperPatch)
  ProjectsHelper.send :include, RedmineCustomFieldsProjectsDefault::ProjectsHelperPatch
end
