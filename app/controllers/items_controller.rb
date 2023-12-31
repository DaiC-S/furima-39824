class ItemsController < ApplicationController
  before_action :move_to_top, except: [:index, :show, :edit]
  before_action :authenticate_user!, only: [:edit]
  before_action :authentication_for_signed_in_user, only: [:edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to '/'
    else
      render '/items/new', status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    redirect_to root_path if @item.order
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy if user_signed_in?
    redirect_to root_path
  end

  def authentication_for_signed_in_user
    redirect_to root_path if user_signed_in? && current_user.id != Item.find(params[:id]).user_id
  end

  private

  def move_to_top
    return if user_signed_in?

    redirect_to action: :index
  end

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :status_id, :shipping_fee_id, :prefecture_id,
                                 :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
