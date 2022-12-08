class PurchaseShippingAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefectures_id, :municipality, :house_number, :building_name, :phone_number, :token, :user_id,
                :item_id

  validates :token, presence: true
  validates :prefectures_id, numericality: { other_than: 1, message: 'を入力してください' }

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフン(-)を入力してください' }
    validates :municipality
    validates :house_number
    validates :phone_number, format: { with: /\A0\d{9,10}\z/ }
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(post_code: post_code, prefectures_id: prefectures_id, municipality: municipality,
                           house_number: house_number, phone_number: phone_number, building_name: building_name, purchase_id: purchase.id)
  end
end
