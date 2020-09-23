class CreateCustomFieldsDefaults < ActiveRecord::Migration[4.2]
  def change
    create_table :custom_fields_defaults do |t|
      t.references :project, type: :integer
      t.references :custom_field, type: :integer
      t.text :value
    end
  end
end
