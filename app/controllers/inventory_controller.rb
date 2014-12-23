class InventoryController < ApplicationController

    def new
    end

    def create
        render plain: params[:inventory].inspect
    end

end
