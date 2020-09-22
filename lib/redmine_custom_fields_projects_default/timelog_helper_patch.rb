require_dependency 'timelog_helper'

module RedmineCustomFieldsProjectsDefault
  module TimelogHelperPatch
    def self.included(base)
      base.send(:include, InstanceMethods)

      base.class_eval do
        # unloadable

      end
    end

    module InstanceMethods
      def billable_disabled
        @project.custom_fields_default ? 
        %w[0 1].include?(@project.custom_fields_default.value.to_s) : false
      end  
    end
  end
end
unless TimelogHelper.included_modules.include?(RedmineCustomFieldsProjectsDefault::TimelogHelperPatch)
  TimelogHelper.send :include, RedmineCustomFieldsProjectsDefault::TimelogHelperPatch
end
