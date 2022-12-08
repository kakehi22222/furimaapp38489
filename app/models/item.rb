class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_info, presence: true
  with_options presence: true, numericality: { other_than: 1, message: 'を入力してください' } do
    validates :category_id
    validates :condition_id
    validates :cost_burden_id
    validates :prefectures_id
    validates :aim_id
  end
  validates :item_price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  belongs_to :user
  has_one_attached :image
  has_one :purchase

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :cost_burden
  belongs_to_active_hash :prefectures
  belongs_to_active_hash :aim
end
