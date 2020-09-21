require_dependency 'custom_field'

module RedmineCustomFieldsProjectsDefault
  module CustomFieldPath
    extend ActiveSupport::Concern

    included do
      has_many :custom_fields_default, dependent: :destroy
    end
  end
end

CustomField.send :include, RedmineCustomFieldsProjectsDefault::CustomFieldPath