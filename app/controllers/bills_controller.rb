class BillsController < ApplicationController
  layout "iberia"
  before_action :set_bill, only: [:show, :edit, :update, :destroy]

  # GET /bills
  # GET /bills.json
  def index
    unless params[:query_date].nil? || params[:query_date] == ''
      query_date = DateTime.strptime(params[:query_date], '%m/%d/%Y')
      startdate = query_date.beginning_of_month
      enddate = query_date.end_of_month
      @bills = Bill.where("created_at >= :start_date AND created_at <= :end_date",
                          {start_date: startdate, end_date: enddate})
    else
      @bills = Bill.all
    end

    @bills.each do |bill|
      cid = bill.customer_id
      begin
        c = Customer.find(cid).customer_id
        bill.customer_id = c
      rescue ActiveRecord::RecordNotFound
        bill.customer_id = ''
      end
    end

    @bills.each do |bill|
      vid = bill.vendor_id
      begin
        v = Vendor.find(vid).vendor_id
        bill.vendor_id = v
      rescue ActiveRecord::RecordNotFound
        bill.vendor_id = ''
      end
    end

    return @bills
  end

  # GET /bills/1
  # GET /bills/1.json
  def show
  end

  # GET /bills/new
  def new
    @bill = Bill.new
  end

  # GET /bills/1/edit
  def edit
  end

  # POST /bills
  # POST /bills.json
  def create
    date_format_transform(:bill_date)
    date_format_transform(:paid_date)

    @bill = Bill.new(bill_params)

    respond_to do |format|
      if @bill.save
        format.html { redirect_to bills_url, notice: 'Bill was successfully created.' }
        format.json { render :show, status: :created, location: @bill }
      else
        format.html { render :new }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bills/1
  # PATCH/PUT /bills/1.json
  def update
    date_format_transform(:bill_date)
    date_format_transform(:paid_date)

    respond_to do |format|
      if @bill.update(bill_params)
        format.html { redirect_to bills_url, notice: 'Bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.json
  def destroy
    @bill.destroy
    respond_to do |format|
      format.html { redirect_to bills_url, notice: 'Bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_params
      params.require(:bill).permit(:bill_no, :customer_id, :billable, :bill_date, :paid_date, :freight, :memo, :vendor_id)
    end

    # Transform datepicker format 'mm/dd/yyyy' to rails format 'dd/mm/yyyy'
    def date_format_transform (sym)
        unless params[:bill][sym].nil? || params[:bill][sym] == ''
            date = DateTime.strptime(params[:bill][sym], '%m/%d/%Y')
            params[:bill][sym] = date.strftime("%d/%m/%Y")
        end
    end
end
