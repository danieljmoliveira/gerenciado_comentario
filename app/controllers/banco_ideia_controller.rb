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
  end

  # GET /banco_ideia/1/edit
  def edit
  end

  # POST /banco_ideia
  # POST /banco_ideia.json
  def create

    @banco_ideium = BancoIdeium.new(banco_ideium_params)

    respond_to do |format|
      if @banco_ideium.save
        format.html { redirect_to :action => 'new'  }
        #format.html { redirect_to @banco_ideium, notice: 'Banco ideium was successfully created.' }
        #format.json { render :show, status: :created, location: @banco_ideium }
      else
        format.html { render :new }
        format.json { render json: @banco_ideium.errors, status: :unprocessable_entity }
      end
    end
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

  def exibir_ideias_tema
    @temas_solicitado = BancoIdeium.ideias_por_temas(params[:codigo_tema])
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_banco_ideium
      @banco_ideium = BancoIdeium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def banco_ideium_params
      params.require(:banco_ideium).permit(:nome, :email, :estado, :cidade, :telefone, :lista_tipo, :titulo, :texto_ideia)
    end
end
