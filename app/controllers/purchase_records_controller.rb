class PurchaseRecordsController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    @purchase_delivery = PurchaseDelivery.new
  end

  def new
    @purchase_delivery = PurchaseDelivery.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_delivery = PurchaseDelivery.new(purchase_delivery_params)
    if @purchase_delivery.valid? 
       @purchase_delivery.save
       redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end
  
  private
  
  def purchase_delivery_params
    params.require(:purchase_delivery).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number)
  end
end
