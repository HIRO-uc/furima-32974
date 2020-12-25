class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:destroy]
  before_action :current_path_item, only: [:show, :destroy, :move_to_index]

  def index
    @items = Item.all.order(created_at: :desc)
  end

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
    current_path_item
  end

  def destroy
    current_path_item
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:price, :image, :name, :description, :category_id, :condition_id, :shipping_fee_status_id,
                                 :shipping_prefecture_id, :shipping_day_id).merge(user_id: current_user.id)
  end

  def move_to_index
    current_path_item
    redirect_to root_path unless @item.user.id == current_user.id
  end

  def current_path_item
    @item = Item.find(params[:id])
  end
end
