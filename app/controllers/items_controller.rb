class ItemsController < ApplicationController

  before_action :move_to_top, except: [:index]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to  '/'
    else 
      render '/items/new', status: :unprocessable_entity
    end
  end

  private

  def move_to_top
    unless user_signed_in?
      redirect_to action: :index  
    end
  end

  def item_params
    params.require(:item).permit(:image,:name,:info,:category_id,:status_id,:shipping_fee_id,:prefecture_id,:scheduled_delivery_id,:price).merge(user_id: current_user.id)
  end

end
