require 'rails_helper'

RSpec.describe User, type: :model do  
  before do
    @user = FactoryBot.build(:user)
  end

  describe '#user registration' do
    it 'fill out user registrarion' do
      expect(@user).to be_valid
    end
    it 'password and password_confirmation resistration' do  
      @user.password = '00000q'
      @user.password_confirmation = '00000q'
      expect(@user).to be_valid
    end
    
    context 'user unregistration' do
      it 'nickname unregistered' do
      end
      it 'email unregistered' do
      end
      it 'password unregistered' do
      end
      it 'family_name unregistered' do
      end
      it 'given_name unregistered' do
      end
      it 'family_name_kana unregistered' do
      end
      it 'given_name_kana unregistered' do
      end
      it 'date_of_birth unregistered' do
      end      
    end
    it 'duplicated email' do
      @user.save
      other_user = FactoryBot.build(:user)
      other_user.email = @user.email
      other_user.valid? 
      expect(other_user.errors.full_messages).to include("Email has already been taken")
    end 
    it 'blank password_confirmaton' do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'password minimum length is 6 characters' do
      @user.password ="1234q"
      @user.password_confirmation = "1234q"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end
end
