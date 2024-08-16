class Coleta < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  def textoData      
      nomeMeses = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro", "NÃO DEFINIDO"]
      numeroMes = self.mes < 12 ? self.mes : 13  
      nomeMeses[numeroMes].to_s + "/" + self.ano.to_s
  end
end
