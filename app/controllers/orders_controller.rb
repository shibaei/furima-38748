class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :set_purchase, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

def index
  @purchase_delivery = PurchaseDelivery.new
end

def create
  @purchase_delivery = PurchaseDelivery.new(donation_params)
  if @purchase_delivery.valid?
    pay_item
    @purchase_delivery.save
    redirect_to root_path
  else
    render :index
  end
end

private

def donation_params
  params.require(:purchase_delivery).permit(:postcode, :province, :locality, :block, :apartment, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
end

def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price,
    card: donation_params[:token],
    currency: 'jpy'
  )
end

def set_item
  @item = Item.find(params[:item_id])
end

def set_purchase
  @purchase = Purchase.pluck(:item_id)
end

def move_to_index
  return if current_user.id != @item.user_id && !@purchase.include?(@item.id)



  redirect_to root_path
end

end
