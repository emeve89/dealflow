class ValuationsController < ApplicationController
  before_action :set_valuation, only: [:show, :edit, :update, :destroy]

  # GET /valuations
  # GET /valuations.json
  def index
    @valuations = Valuation.all
  end

  # GET /valuations/1
  # GET /valuations/1.json
  def show
  end

  # GET /valuations/new
  def new
    @valuation = ValuationFormObject.new
    @parts = Part.all
  end

  # GET /valuations/1/edit
  def edit
  end

  # POST /valuations
  # POST /valuations.json
  def create
    @valuation = ValuationFormObject.new(params[:valuation_form_object])
    
    respond_to do |format|
      if @valuation.save
        format.html { redirect_to valuations_path, notice: 'Valuation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @valuation }
      else
        format.html { render action: 'new' }
        format.json { render json: @valuation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /valuations/1
  # PATCH/PUT /valuations/1.json
  def update
    respond_to do |format|
      if @valuation.update(valuation_params)
        format.html { redirect_to @valuation, notice: 'Valuation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @valuation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /valuations/1
  # DELETE /valuations/1.json
  def destroy
    @valuation.destroy
    respond_to do |format|
      format.html { redirect_to valuations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_valuation
      @valuation = Valuation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def valuation_params
      params.require(:valuation).permit(:description, :part_id, :valuation_id, 
        :purchase_price, :valuation_line
      )
    end
end
