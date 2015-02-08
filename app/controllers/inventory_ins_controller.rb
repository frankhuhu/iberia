class InventoryInsController < ApplicationController
  layout "iberia"
  before_action :set_inventory_in, only: [:show, :edit, :update, :destroy]

  # GET /inventory_ins
  # GET /inventory_ins.json
  def index
    @query_date = DateTime.current
    unless params[:query_date].nil? || params[:query_date] == ''
      @query_date = DateTime.strptime(params[:query_date], '%m/%d/%Y')
    end

    startdate = @query_date.beginning_of_month
    enddate = @query_date.end_of_month
    @inventory_ins = InventoryIn.where("created_at >= :start_date AND created_at <= :end_date",
                                       {start_date: startdate, end_date: enddate})

    @inventory_ins.each do |ii|
      vid = ii.vendor
      begin
        s = Vendor.find(vid).vendor_id
        ii.vendor = s
      rescue ActiveRecord::RecordNotFound
        ii.vendor = ''
      end
    end
    return @inventory_ins
  end

  # GET /inventory_ins/1
  # GET /inventory_ins/1.json
  def show
  end

  # GET /inventory_ins/new
  def new
    @inventory_in = InventoryIn.new
  end

  # GET /inventory_ins/1/edit
  def edit
  end

  # POST /inventory_ins
  # POST /inventory_ins.json
  def create
    date_format_transform(:in_date)
    date_format_transform(:paid_date)

    @inventory_in = InventoryIn.new(inventory_in_params)

    respond_to do |format|
      if @inventory_in.save
        format.html { redirect_to inventory_ins_url, notice: 'Inventory in was successfully created.' }
        format.json { render :show, status: :created, location: @inventory_in }
      else
        format.html { render :new }
        format.json { render json: @inventory_in.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventory_ins/1
  # PATCH/PUT /inventory_ins/1.json
  def update
    date_format_transform(:in_date)
    date_format_transform(:paid_date)

    respond_to do |format|
      if @inventory_in.update(inventory_in_params)
        format.html { redirect_to inventory_ins_url, notice: 'Inventory in was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory_in }
      else
        format.html { render :edit }
        format.json { render json: @inventory_in.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory_ins/1
  # DELETE /inventory_ins/1.json
  def destroy
    @inventory_in.destroy
    respond_to do |format|
      format.html { redirect_to inventory_ins_url, notice: 'Inventory in was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_in
      @inventory_in = InventoryIn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_in_params
      params.require(:inventory_in).permit(:invoice, :vendor, :in_date, :content, :paid_date, :po, :truck)
    end

    # Transform datepicker format 'mm/dd/yyyy' to rails format 'dd/mm/yyyy'
    def date_format_transform (sym)
        unless params[:inventory_in][sym].nil? || params[:inventory_in][sym] == ''
            date = DateTime.strptime(params[:inventory_in][sym], '%m/%d/%Y')
            params[:inventory_in][sym] = date.strftime("%d/%m/%Y")
        end
    end
end
