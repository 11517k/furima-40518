class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_root_if_not_owner_or_sold, only: [:edit, :update]
  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect_to_root_if_not_owner_or_sold
    if current_user.id != @item.user.id || @item.purchase_record.present?
      redirect_to root_path
    end
  end
  def item_params
    params.require(:item).permit(:image, :item_name, :price, :description, :category_id, :item_condition_id,
                                 :shipping_fee_payer_id, :prefecture_id, :days_to_ship_id).merge(user_id: current_user.id)
  end
end