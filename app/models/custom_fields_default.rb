class CustomFieldsDefault < ActiveRecord::Base
  belongs_to :project
  belongs_to :custom_field

  def customized
  end
end
