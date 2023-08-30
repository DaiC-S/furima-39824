class ItemsController < ApplicationController

  before_action :move_to_top, except: [:index]

  def index
  end

  def new
    @item = Item.new
  end

  private

  def move_to_top
    unless user_signed_in?
      redirect_to action: :index  
    end
  end

end
