class Municipio
  include ActiveModel::Serializers::JSON

  attr_accessor :id, :nome

  def codigoIBGEMunicipio
    self.id
  end
end
