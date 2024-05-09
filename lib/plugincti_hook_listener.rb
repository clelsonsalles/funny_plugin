class PluginctiHookListener < Redmine::Hook::ViewListener
  render_on :view_layouts_base_html_head, partial: "cti_plugin/base_html" 
end
