class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :redirect_to_root_if_owner_or_sold, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase_delivery = PurchaseDelivery.new
  end

  def create
    @purchase_delivery = PurchaseDelivery.new(purchase_delivery_params)
    if @purchase_delivery.valid? 
      pay_item
       @purchase_delivery.save
       redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_delivery_params
    params.require(:purchase_delivery).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_delivery_params[:token],    
      currency: 'jpy'                 
    )
  end

  def redirect_to_root_if_owner_or_sold
    if current_user.id == @item.user.id || @item.purchase_record.present?
      redirect_to root_path
    end
  end
end
