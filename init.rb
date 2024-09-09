Redmine::Plugin.register :funny_plugin do
  name 'Funny Plugin'
  author 'Marcus Daniel'
  description 'Este é um plugin do Redmine, feito pela equipe da Funny'
  version '0.0.1'
  url 'https://github.com/clelsonsalles/funny_plugin/'
  author_url 'http://example.com/about'

  settings :default => {
    :projetoId_inicial => "projetoId_inicial",
    :objetivoId_inicial => "objetivoId_inicial",
    :krId_inicial => "krId_inicial"
  }, :partial => 'cti_plugin/configuracao_plugin'


  delete_menu_item :top_menu, :my_page
  delete_menu_item :top_menu, :projects
  delete_menu_item :top_menu, :help
  delete_menu_item :admin_menu, :projects
  delete_menu_item :admin_menu, :groups
  delete_menu_item :admin_menu, :roles
  delete_menu_item :admin_menu, :trackers
  delete_menu_item :admin_menu, :issue_statuses
  delete_menu_item :admin_menu, :workflows
  delete_menu_item :admin_menu, :custom_fields
  delete_menu_item :admin_menu, :enumerations
  delete_menu_item :admin_menu, :auth_sources
  delete_menu_item :admin_menu, :plugins
  delete_menu_item :admin_menu, :info

  delete_menu_item :project_menu, :overview
  delete_menu_item :project_menu, :activity
  delete_menu_item :project_menu, :issues_calendar
  delete_menu_item :project_menu, :issues_gantt
  delete_menu_item :project_menu, :time_entries
  delete_menu_item :project_menu, :issues
  delete_menu_item :project_menu, :news
  delete_menu_item :project_menu, :settings
  
  delete_menu_item :application_menu, :projects
  delete_menu_item :application_menu, :activity
  delete_menu_item :application_menu, :issues
  delete_menu_item :application_menu, :time_entries
  delete_menu_item :application_menu, :issues_gantt
  delete_menu_item :application_menu, :issues_calendar
  delete_menu_item :application_menu, :news


  
  
  
  
end

