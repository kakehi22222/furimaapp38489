class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :access_guard, only: [:edit, :destroy]
  before_action :purchase_guard, only: [:edit, :destroy]

  def index
    @items = Item.includes(:user).order(created_at: 'DESC')
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :item_info, :category_id, :condition_id, :cost_burden_id, :prefectures_id,
                                 :aim_id, :item_price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def access_guard
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def purchase_guard
    redirect_to root_path if @item.purchase.present?
  end
end
