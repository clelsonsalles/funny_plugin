class Uf
  include ActiveModel::Serializers::JSON
  include Redmine::SafeAttributes

  attr_accessor :id, :sigla, :nome

  def codigoIBGEUF
    self.id
  end
end
