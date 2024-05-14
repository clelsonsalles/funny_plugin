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
end
