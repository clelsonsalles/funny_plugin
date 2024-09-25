class ColetaanualController < ApplicationController
  

  def fazerEncalcesContratados
    Rails.logger.info "Params: " + params.nil? ? + "nil" : #{params}
    Rails.logger.info "coleta: " + @coleta.nil? ? + "nil" : #{@coleta}
    
    if @coleta.nil?
      @coleta = Coleta.new    
      @coleta.safe_attributes = params[:coleta]
    end
    
    @coletas = Coleta.where(:tipoColeta =>  @coleta.tipoColeta, :project_id =>  @coleta.project_id, :mes => @coleta.mes, :ano => @coleta.ano  )
  
  end

 def atualizarEncalcesContratados
    @coleta = Coleta.new    
    @coleta.safe_attributes = params[:coleta]

    @coleta.dataRealizacao = Time.current

    @coleta.save


    @coletas = Coleta.where(:tipoColeta =>  @coleta.tipoColeta, :project_id =>  @coleta.project_id, :mes => @coleta.mes, :ano => @coleta.ano  )

    redirect_to :back, :@coleta => @coleta

  
 end
  
end
