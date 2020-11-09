class PurchaseController < ApplicationController

  def index
    @user_buy= UserBuy.new
    @item = Item.find(params[:item_id])
    end

  def new
    @user_buy = UserBuy.new
  end
 
  def create
    @item = Item.find(params[:item_id])
    @user_buy = UserBuy.new(user_buy_params)
    if @user_buy.valid?
      pay_item
      @user_buy.save
      redirect_to :root
    else
      render action: :index
    end
  end
 
  private
  def user_buy_params
   params.require(:user_buy).permit(:post, :shipment_source_id, :first_number, :second_number, :building_name, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @item.price,
        card: user_buy_params[:token],
        currency: 'jpy'
      )
  end

end
