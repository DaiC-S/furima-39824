class ItemsController < ApplicationController
  before_action :move_to_top, except: [:index, :show]

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
