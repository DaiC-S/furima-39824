class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :please_signed_in

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]

    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new

    if @item.order != nil || current_user == @item.user
      redirect_to  root_path
    end
    
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)

    if @order_address.valid?
      buy_item
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def please_signed_in
    redirect_to  new_user_session_path unless user_signed_in?
  end

  private
 
  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :street_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id].to_i, token: params[:token])
  end

  def buy_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],   
      currency: 'jpy'                
    )
  end

end
