class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    # @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :description, :category_id, :item_name, :status_id, :price, :charge_id, :shipment_source_id, :day_id).merge(user_id: current_user.id)
  end
end
