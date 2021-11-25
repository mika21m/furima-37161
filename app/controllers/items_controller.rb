class ItemsController < ApplicationController
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    # create = new + save
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :status_id, :shipping_cost_id,
                                 :shipping_prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
