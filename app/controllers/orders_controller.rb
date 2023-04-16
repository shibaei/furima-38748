class OrdersController < ApplicationController
  before_action :authenticate_user!

def index
  @purchase_delivery = PurchaseDelivery.new
  @item = Item.find(params[:item_id])
end

def create
  @item = Item.find(params[:item_id])
  @purchase_delivery = PurchaseDelivery.new(donation_params)
  if @purchase_delivery.valid?
    @purchase_delivery.save
    redirect_to root_path
  else
    render :index
  end
end

private

def donation_params
  params.require(:purchase_delivery).permit(:postcode, :province, :locality, :block, :apartment, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
end

end
