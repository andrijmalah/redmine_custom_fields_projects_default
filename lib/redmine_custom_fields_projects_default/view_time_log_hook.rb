module RedmineCustomFieldsProjectsDefault
  module ViewTimeLogHook
    class TimeLogCudtomFieldsHook < Redmine::Hook::ViewListener
      render_on :view_timelog_edit_form_bottom, partial: 'time_log/edit_form_bottom_hook'
    end
  end
end