require_dependency 'timelog_controller'

module RedmineCustomFieldsProjectsDefault
  module TimelogControllerPatch
    def self.included(base)
      base.send(:include, InstanceMethods)

      base.class_eval do
        def new
          @time_entry ||= TimeEntry.new(project: @project, issue: @issue, user: User.current, spent_on: User.current.today)
          @time_entry.safe_attributes = params[:time_entry]
          if @project && @project.custom_fields_default && @project.custom_fields_default.value
            @time_entry.safe_attributes = {
              'custom_field_values' => {
                @project.custom_fields_default.custom_field_id.to_s => @project.custom_fields_default.value
              }
            }
          end
        end
      end
    end

    module InstanceMethods
    end

  end
end
# unless TimelogController.included_modules.include?(RedmineCustomFieldsProjectsDefault::TimelogControllerPatch)
  TimelogController.send :include, RedmineCustomFieldsProjectsDefault::TimelogControllerPatch
# end  