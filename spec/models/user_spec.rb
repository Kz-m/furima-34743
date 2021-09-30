require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe '#user registration' do
    context 'acceptable user registration' do
      it 'fill out user registration' do
        expect(@user).to be_valid
      end
      it 'password and password_confirmation resistration' do
        @user.password = '00000q'
        @user.password_confirmation = '00000q'
        expect(@user).to be_valid
      end
    end

    context 'when user unregistration because blank' do
      it 'nickname unregistered' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'email unregistered' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'password unregistered' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'password_confirmation unregistered' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_name unregistered' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'given_name unregistered' do
        @user.given_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name can't be blank")
      end
      it 'family_name_kana unregistered' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it 'given_name_kana unregistered' do
        @user.given_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name kana can't be blank")
      end
      it 'date_of_birth unregistered' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
    end

    context 'unregistration validations for user' do
      it 'duplicated email' do
        @user.save
        other_user = FactoryBot.build(:user)
        other_user.email = @user.email
        other_user.valid?
        expect(other_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'email does not include @' do
        @user.email = 'abcd.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'family_name must be full-width characters' do
        @user.family_name = 'halfwidth'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid. Input full-width characters')
      end
      it 'given_name must be full-width characters' do
        @user.given_name = 'halfwidth'
        @user.valid?
        expect(@user.errors.full_messages).to include('Given name is invalid. Input full-width characters')
      end
      it 'family_name_kana must be full-width katakana characters' do
        @user.family_name_kana = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid. Input full-width katakana characters')
      end
      it 'given_name_kana must be full-width katakana characters' do
        @user.given_name_kana = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include('Given name kana is invalid. Input full-width katakana characters')
      end
    end

    context 'unregistration validations of password' do
      it 'password and password_confirmation does not match' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'password minimum length is 6 characters' do
        @user.password = '1234q'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'password containing only letters' do
        @user.password = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Input half-width characters include both leters and numbers')
      end
      it 'password containing only numbers' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Input half-width characters include both leters and numbers')
      end
      it 'password includes double-byte characters' do
        @user.password = '１アあＡｑ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Input half-width characters include both leters and numbers')
      end
    end
  end
end
