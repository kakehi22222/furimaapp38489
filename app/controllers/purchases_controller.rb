class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :purchase_guard, only: [:index, :create]

  def index
    @purchase_shipping_address = PurchaseShippingAddress.new
  end

  def create
    @purchase_shipping_address = PurchaseShippingAddress.new(purchase_params)
    if @purchase_shipping_address.valid?
      pay_item
      @purchase_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping_address).permit(:post_code, :prefectures_id, :municipality, :house_number, :building_name, :phone_number).merge(
      item_id: @item.id, user_id: current_user.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.item_price,  # 商品の値段
      card: purchase_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def purchase_guard
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.purchase.present? || current_user.id == @item.user_id
  end
end
