class CustomFieldsDefault < ActiveRecord::Base
  belongs_to :project
  belongs_to :custom_field

  validates_presence_of :project, :custom_field

  def customized; end
end
