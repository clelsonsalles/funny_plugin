class Uf
  include ActiveModel::Serializers::JSON

  attr_accessor :id, :sigla, :nome

  def codigoIBGEUF
    self.id
  end
end
