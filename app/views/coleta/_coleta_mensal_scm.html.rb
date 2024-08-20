       <div class="card-body">
              <%= form_for @coleta, url: coleta_mensalatualizar_path do |f| %>
                   <%= f.hidden_field :id_coleta, :value => @coleta.id %>

                    <div class="box-title"><%= @coleta.tipoColeta %></div>
                       <div class="box-description">Coleta de dados de acessos:
                         
                       <div class="row mb-3">
                         <div class="col-md-6">
                              <p><%= f.label :uf, "Selecione o Estado" %></p>
                              <p><%= f.select :uf, options_for_select([['AC', 'AC'], ['AL', 'AL'], ['AP', 'AP'], ['AM', 'AM'], ['BA', 'BA'], ['CE', 'CE'], ['DF', 'DF'], ['ES', 'ES'], ['GO', 'GO'], ['MA', 'MA'], ['MT', 'MT'],['MS', 'MS'], ['MG', 'MG'], ['PA', 'PA'], ['PB', 'PB'], ['PR', 'PR'], ['PE', 'PE'], ['PI', 'PI'], ['RJ', 'RJ'], ['RN', 'RN'], ['RS', 'RS'], ['RO', 'RO'], ['RR', 'RR'], ['SC', 'SC'], ['SP', 'SP'], ['SE', 'SE'], ['TO', 'TO']]) {}, class:'form-select' %></p>
                         </div>
                         <div class="col-md-6">
                               <p><%= f.label :cidade, "Cidade", class: "form-label" %></p>
                               <p><%= f.text_field :cidade, class: "form-control", id: "cidade", placeholder: "Digite a cidade" %></p>
                         </div>
                       </div>

                      <div class="row mb-3">
                        <div class="col-md-6">
                          <p><%= f.label :tipoCliente, "Tipo de Cliente", class: "form-label" %></p>
                          <p><%= f.select :tipoCliente, options_for_select([['PF', 'Pessoa Física'], ['PJ', 'Pessoa Jurídica'], ['UP', 'Uso Próprio']]) %></p>
                        </div>
                        <div class="col-md-6">
                          <p><%= f.label :tipoAtendimento, "Tipo de Atendimento", class: "form-label" %></p>
                          <p><%= f.select :tipoAtendimento, options_for_select([['rural', 'Rural'], ['urbano', 'Urbano']]) %></p>
                        </div>
                      </div>

                     <div class="row mb-3">
                       <div class="col-md-6">
                          <p><%= f.label :tipoMeio, "Tipo de Meio", class: "form-label" %></p>
                          <p><%= f.select :tipoMeio, options_for_select([['cabo_coaxial', 'Cabo_coaxial'], ['cabo_metalico', 'Cabo_metálico'], ['satelite', 'Satélite'], ['radio', 'Rádio'], ['fibra', 'Fibra']]) %></p>
                        </div>

                      <div class="col-md-6">
                          <p><%= f.label :tipoTecnologia, "Tipo de Tecnologia", class: "form-label" %></p>
                          <p><%= f.select :tipoTecnologia, options_for_select([['ADSL', 'ADSL'], ['ADSL2', 'ADSL2'], ['AMPS', 'AMPS'], ['ATM', 'ATM'], ['Cable Modem', 'Cable Modem'], ['CDMA_IS_95	', 'CDMA IS 95	'],
                          ['DTH', 'DTH'], ['EDGE', 'EDGE'], ['ETHERNET', 'ETHERNET'], ['FR', 'FR'], ['FTTB', 'FTTB'], ['FTTH', 'FTTH'], ['GPRS', 'GPRS'], ['GSM', 'GSM'], ['HDSL', 'HDSL'],  ['HDSL', 'HDSL'],
                          ['HFS', 'HFS'], ['HSDPA', 'HSDPA'], ['HSPA+', 'HSPA+'], ['HSPAP', 'HSPAP'], ['HSUPA', 'HSUPA'], ['LTE', 'LTE'], ['NR_NSA', 'NR NSA'], ['NR_SA', 'NR SA'], ['OFDMA_TDD', 'OFDMA/TDD'],
                          ['Acesso_livre_via_satElite', 'Acesso livre via satélite'], ['SDH', 'SDH'], ['SONET', 'SONET'], ['VDSL', 'VDSL'], ['VSAT', 'VSAT'], [' WCDMA', ' WCDMA'], ['Wi-Fi', ' Wi-Fi'],
                          ['WIMAX', ' WIMAX']]) %></p>
                      </div>
                    </div>

                     <div class="row mb-3">
                       <div class="col-md-6">
                          <p><%= f.label :tipoProduto, "Tipo de Produto", class: "form-label" %></p>
                          <p><%= f.select :tipoProduto, options_for_select([['Internet', 'Internet'], ['Linha_dedicada', 'Linha_dedicada'], ['m2m', 'm2m'], ['outros', 'outros']]) %></p>
                       </div>
                       <div class="col-md-6">
                               <p><%= f.label :velocidade, "Velocidade", class: "form-label" %></p>
                               <p><%= f.text_field :velocidade, class: "form-control", id: "velocidade", placeholder: "Digite a velocidade" %></p>
                       </div>
                     </div>

                     <div class="row mb-3">
                       <div class="col-md-6">
                          <p><%= f.label :quantidadeAcesso, "Quantidade", class: "form-label" %></p>
                          <p><%= f.text_field :quantidadeAcesso, class: "form-control", id: "quantidadeAcesso", placeholder: "Digite a quantidade" %></p>
                       </div>
                       <div class="col-md-6">
                          <p><%= f.label :codigoIBGE, "Código IBGE", class: "form-label" %></p>
                          <p><%= f.text_field :codigoIBGE, class: "form-control", id: "codigoIBGE", placeholder: "Código IBGE" %></p>
                       </div>
                     </div>
          
                     <%= f.submit "Adicionar", class:" btn btn-primary" %>



               <% end %>

  </div>
</div>
