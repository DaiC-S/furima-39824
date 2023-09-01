class ItemsController < ApplicationController
  before_action :move_to_top, except: [:index, :show, :edit]
  before_action :authenticate_user!, only: [:edit]
  before_action :authentication_for_signed_in_user, only: [:edit]

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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
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
end
