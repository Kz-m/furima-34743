require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '#item put_up_for_sale' do
    context 'acceptable item registration' do
      it 'fill out item registration' do
        expect(@item).to be_valid
      end
      it 'an image attached' do
        expect(@item).to be_valid
      end
    end

    context 'when item unregistration because blank' do
      it 'image unregistered' do
        @item.image = nil # ActiveStrageの特性でここは""ではなくnil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'name unregistered' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'description unregistered' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_id unregistered' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_id unregistered' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'prefecture_id unregistered' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'shipping_fee_id unregistered' do
        @item.shipping_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it 'shipping_day_id unregistered' do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it 'price unregistered' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end

    context 'unregistration validations for item' do
      it 'price range is greater than ¥300' do
        @item.price = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range.Input between ¥300 to ¥9,999,999')
      end
      it 'price range is less than ¥9,999,999' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range.Input between ¥300 to ¥9,999,999')
      end
      it 'price must be half-width number' do
        @item.price = 'aAあア１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width number')
      end
      it 'Is valid with item, user' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  en