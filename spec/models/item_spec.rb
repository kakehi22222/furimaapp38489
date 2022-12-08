require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できる場合' do
      it '内容を全て入力していれば保存できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない場合' do
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空では保存できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_infoが空では保存できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end
      it 'item_priceが空だと保存できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it '価格に半角数字以外が含まれている場合は出品できない' do
        @item.item_price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end
      it '価格が300円未満では出品できない' do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be greater than or equal to 300')
      end
      it '価格が9_999_999円を超えると出品できない' do
        @item.item_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be less than or equal to 9999999')
      end
      it 'category_idが1だと保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category を入力してください')
      end
      it 'condition_idが1だと保存できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition を入力してください')
      end
      it 'cost_burden_idが1だと保存できない' do
        @item.cost_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Cost burden を入力してください')
      end
      it 'prefectures_idが1だと保存できない' do
        @item.prefectures_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefectures を入力してください')
      end
      it 'aim_idが1だと保存できない' do
        @item.aim_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Aim を入力してください')
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
