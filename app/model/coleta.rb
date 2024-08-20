class Coleta < ActiveRecord::Base
  include Redmine::SafeAttributes
  belongs_to :user
  belongs_to :project

  def textoData      
      nomeMeses = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro", "NÃO DEFINIDO"]
      numeroMes = self.mes < 12 ? self.mes : 13  
      nomeMeses[numeroMes -1].to_s + "/" + self.ano.to_s
  end

  def status
      time = Time.new
      if self.dataRealizacao.nil?
          status = self.ano < time.year ? "Coleta Atrasada" : 
                    self.mes < time.month ? "Coleta Atrasada" : "Aguardando Coleta"
      else 
        if self.dataInformacaoEnvio.nil?
            status = "Coleta Realizada"
        else
            status = "Coleta Enviada"
        end
      end

      status
  end
end
