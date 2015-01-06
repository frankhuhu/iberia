class TruckingsController < ApplicationController
  layout "iberia"
  before_action :set_trucking, only: [:show, :edit, :update, :destroy]

  # GET /truckings
  # GET /truckings.json
  def index
    @truckings = Trucking.all
  end

  # GET /truckings/1
  # GET /truckings/1.json
  def show
  end

  # GET /truckings/new
  def new
    @trucking = Trucking.new
  end

  # GET /truckings/1/edit
  def edit
  end

  # POST /truckings
  # POST /truckings.json
  def create
    @trucking = Trucking.new(trucking_params)

    respond_to do |format|
      if @trucking.save
        format.html { redirect_to truckings_url, notice: 'Trucking was successfully created.' }
        format.json { render :show, status: :created, location: @trucking }
      else
        format.html { render :new }
        format.json { render json: @trucking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /truckings/1
  # PATCH/PUT /truckings/1.json
  def update
    date_format_transform(:order_date)
    date_format_transform(:received_date)

    respond_to do |format|
      if @trucking.update(trucking_params)
        format.html { redirect_to truckings_url, notice: 'Trucking was successfully updated.' }
        format.json { render :show, status: :ok, location: @trucking }
      else
        format.html { render :edit }
        format.json { render json: @trucking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /truckings/1
  # DELETE /truckings/1.json
  def destroy
    @trucking.destroy
    respond_to do |format|
      format.html { redirect_to truckings_url, notice: 'Trucking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trucking
      @trucking = Trucking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trucking_params
      params.require(:trucking).permit(:vendor_po, :vendor, :truck_po, :trucker, :pol, :order_date, :received_date, :commodity, :remarks)
    end

    # Transform datepicker format 'mm/dd/yyyy' to rails format 'dd/mm/yyyy'
    def date_format_transform (sym)
        unless params[:trucking][sym].nil? || params[:trucking][sym] == ''
            date = DateTime.strptime(params[:trucking][sym], '%m/%d/%Y')
            params[:trucking][sym] = date.strftime("%d/%m/%Y")
        end
    end
end
