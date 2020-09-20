require_dependency 'project'

module RedmineCustomFieldsProjectsDefault
  module ProjectPatch
    extend ActiveSupport::Concern

    included do
      has_one :custom_fields_default, :dependent => :destroy
      accepts_nested_attributes_for :custom_fields_default, allow_destroy: true
    end
  end
end

Project.send :include, RedmineCustomFieldsProjectsDefault::ProjectPatch