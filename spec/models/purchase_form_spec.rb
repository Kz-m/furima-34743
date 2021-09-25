require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    user = FactoryBot.create(:user) #.createはDBのデータを使用する
    item = FactoryBot.create(:item)
    @purchase_form = FactoryBot.build(:purchase_form, user_id: user.id, item_id: item.id)
  end
  describe '#item purchase format' do
    context 'acceptable purchase_form registration' do
      it 'fill out purchase_form' do
        expect(@purchase_form).to be_valid
      end
      it 'building_name can be blank' do
        @purchase_form.building_name = ''
        expect(@purchase_form).to be_valid
      end
    end

    context 'when purchase_form unregistration because blank' do
      it 'zipcode unregistered' do
        @purchase_form.zipcode = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Zipcode can't be blank")
      end
      #it 'prefecture_id unregistered' do
      #  @purchase_form.prefecture_id = 0
      #  @purchase_form.valid?
      #  expect(@purchase_form.errors.full_messages).to include("Prefecture can't be blank")
      #end
      it 'locality unregistered' do
        @purchase_form.locality = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Locality can't be blank")
      end
      it 'address unregistered' do
        @purchase_form.address = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_number unregistered' do
        @purchase_form.phone_number = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number can't be blank")
      end
      #it 'token unregistered' do
      #  @purchase_form.token = ''
      #  @purchase_form.valid?
      #  expect(@purchase_form.errors.full_messages).to include("")
      #end     
    end

    context 'unregistration validations for purchase_form' do
      it 'zipcode must include hypen' do
        @purchase_form.zipcode = '1234567'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Zipcode is invalid. Input hyphen")
      end
      it 'phone_number maximum length is 11 number' do
        @purchase_form.phone_number = '090123456789'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number is invalid. Input only half-width number at most 11 digits long")
      end
      it 'phone_number must be half-width number' do
        @purchase_form.phone_number = 'a0901234567'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number is invalid. Input only half-width number at most 11 digits long")
      end
    end
  end
end