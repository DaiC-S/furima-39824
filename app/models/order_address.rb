class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :street_number, :building,:phone_number 

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street_number
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid."}
    validates :order_id
  end

  def save
    order = Order.create(user_id: current_user.id, item_id: params[:item_id].to_i)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_number: street_number, building: building, phone_number: phone_number, order_id: order.id)
  end
end