class InventoryController < ApplicationController

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

        if @inventory.update(inventory_params)
            redirect_to @inventory
        else
            render 'edit'
        end
    end

    def destroy
        @inventory = Inventory.find(params[:id])
        @inventory.destroy

        redirect_to action: "index"
    end

private
    def inventory_params
        params.require(:inventory).permit(
            :invoice, :customer, :paid_date, :side, :o_f, :crt, 
            :seal, :bale, :weight, :bgk, :erd, :cutoff_date, :note, 
            :in_date, :out_date, :bl, :pic, :truck, :paid)
    end

end
