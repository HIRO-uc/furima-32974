class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  private

  def item_params
    params.require(:item).permit(:price, :image, :name, :description, :category_id, :condition_id, :shipping_fee_status_id, :shipping_prefecture_id, :shipping_day_id).merge(user_id: current_user.id)
  end
end
