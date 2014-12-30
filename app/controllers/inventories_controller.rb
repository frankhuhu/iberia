class InventoriesController < ApplicationController
    layout "iberia"

    def index
        @inventories = Inventory.all
    end

    def new
        @inventory = Inventory.new
    end

    def create
        #render plain: params[:inventory].inspect
        @inventory = Inventory.new(inventory_params)

        if @inventory.save
            redirect_to @inventory
        else
            render 'new'
        end
    end

    def show
        @inventory = Inventory.find(params[:id])
    end

    def edit
        @inventory = Inventory.find(params[:id])
    end

    def update
        @inventory = Inventory.find(params[:id])

        date_format_transform(:paid_date)
        date_format_transform(:cutoff_date)
        date_format_transform(:in_date)
        date_format_transform(:out_date)

        if @inventory.update(inventory_params)
            redirect_to inventories_path
        else
            render 'edit'
        end
    end

    def destroy
        @inventory = Inventory.find(params[:id])
        @inventory.destroy

        redirect_to inventories_path
    end

private
    def inventory_params
        params.require(:inventory).permit(
            :invoice, :customer, :paid_date, :side, :o_f, :crt, 
            :seal, :bale, :weight, :bgk, :erd, :cutoff_date, :note, 
            :in_date, :out_date, :bl, :pic, :truck, :paid)
    end

    # Transform datepicker format 'mm/dd/yyyy' to rails format 'dd/mm/yyyy'
    def date_format_transform (sym)
        unless params[:inventory][sym].nil? || params[:inventory][sym] == ''
            date = DateTime.strptime(params[:inventory][sym], '%m/%d/%Y')
            params[:inventory][sym] = date.strftime("%d/%m/%Y")
        end
    end

end
