class BancoIdeiaController < ApplicationController
  before_action :set_banco_ideium, only: [:show, :edit, :update, :destroy]

  # GET /banco_ideia
  # GET /banco_ideia.json
  def index
    @banco_ideia = BancoIdeium.all
  end

  # GET /banco_ideia/1
  # GET /banco_ideia/1.json
  def show
  end

  # GET /banco_ideia/new
  def new
    @banco_ideium = BancoIdeium.new
    @ideias = BancoIdeium.all
    @temas = Tema.all
    @estado = CidadeEstado.all.select('distinct estado')
  end

  # GET /banco_ideia/1/edit
  def edit
  end

  # POST /banco_ideia
  # POST /banco_ideia.json
  def create
    array_tema = params[:tema][:selecionado].split(',') 
    @banco_ideium = BancoIdeium.new(banco_ideium_params)

    #BancoIdeium.transaction do
      respond_to do |format|
       # if verify_recaptcha
          if @banco_ideium.save 
            array_tema.each do |t|
              @banco_ideia_tema = BancoIdeiaTema.new
              @banco_ideia_tema.banco_ideium_id = @banco_ideium.id
              @banco_ideia_tema.tema_id = t.to_i
              @banco_ideia_tema.save
            end
            flash[:notice] = "Sucesso."
            format.html { redirect_to :action => 'new'  }
            format.json { render :show, status: :created, location: @banco_ideium }
          else
            format.html { render :action => 'new' }
            #flash[:notice] = "Erro"
            #format.html { redirect_to :action=>'new' }
            #format.json { render json: @banco_ideium.errors, status: :unprocessable_entity }
          end
        #else
       #   format.js 
       #   flash[:notice] = "Não conectou"
          #flash.delete(:recaptcha_error) # get rid of the recaptcha error being flashed by the gem.
          #flash.now[:error] = 'reCAPTCHA is incorrect. Please try again.'
       #   format.html { redirect_to :action=>'new'  }
       #   format.json { render json: @banco_ideium.errors, status: :unprocessable_entity }
       # end
      end
    #end
  end

  # PATCH/PUT /banco_ideia/1
  # PATCH/PUT /banco_ideia/1.json
  def update
    respond_to do |format|
      if @banco_ideium.update(banco_ideium_params)
        format.html { redirect_to @banco_ideium, notice: 'Banco ideium was successfully updated.' }
        format.json { render :show, status: :ok, location: @banco_ideium }
      else
        format.html { render :edit }
        format.json { render json: @banco_ideium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /banco_ideia/1
  # DELETE /banco_ideia/1.json
  def destroy
    @banco_ideium.destroy
    respond_to do |format|
      format.html { redirect_to banco_ideia_url, notice: 'Banco ideium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def escolher_cidade
     @cidades = CidadeEstado.where(estado: params[:estado])
     respond_to do |format|
      format.html {render :partial => 'escolher_cidade'}
    end
  end

  def exibir_ideias_tema
    if params[:codigo_tema] == ""
      @temas_solicitado = BancoIdeium.all
    else
      @temas_solicitado = BancoIdeiaTema.pesquisa_temas(params[:codigo_tema])
    end
    respond_to do |format|
      format.html {render :partial => 'exibir_ideias_tema'}
    end
  end

  def exibir_ideia_completa
    @ideia_solicitada = BancoIdeium.find(params[:codigo_ideia])
    respond_to do |format|
      format.html {render :partial => 'exibir_ideia_completa'}
    end
  end

  def classificar_ideia
    @voto_ideia = IdeiaVoto.new
    @voto_ideia.banco_ideium_id = params[:numero]
    @voto_ideia.voto = params[:opcao]
    @voto_ideia.save
    redirect_to :action => 'new'
  end

  def validar_recaptcha
    raise verify_recaptcha.inspect
    unless verify_recaptcha
      raise 'invalido'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_banco_ideium
      #@banco_ideium = BancoIdeium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def banco_ideium_params
      params.require(:banco_ideium).permit(:nome, :email, :estado, :cidade, :telefone, :lista_tipo, :titulo, :texto_ideia)
    end
end
