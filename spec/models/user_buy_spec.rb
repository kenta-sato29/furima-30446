require 'rails_helper'
describe UserBuy, type: :model do
  before do
    @user_buy = FactoryBot.build(:user_buy)
  end

  describe '商品購入機能' do
    context '商品購入機能がうまくいくとき' do
      it 'post,shipment_source_id,first_number,second_number,tel,token が存在すれば登録できる' do
        expect(@user_buy).to be_valid
      end
      it 'building_nameが空でも保存できること' do
        @user_buy.building_name = nil
        expect(@user_buy).to be_valid
      end
    end

    context '商品出品機能ががうまくいかないとき' do
      it 'postが空だと登録できない' do
        @user_buy.post = ''
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Post can't be blank")
      end
      it 'postにはハイフン(-)がないと保存できないこと' do
        @user_buy.post = '1111111'
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include('Post is invalid. Include hyphen(-)')
      end
      it 'shipment_source_idが空だと保存できないこと' do
        @user_buy.shipment_source_id = ''
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Shipment source can't be blank")
      end
      it 'shipment_source_idが1だと登録できない' do
        @user_buy.shipment_source_id = 1
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include('Shipment source must be other than 1')
      end
      it 'first_numberが空だと保存できないこと' do
        @user_buy.first_number = ''
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("First number can't be blank")
      end
      it 'second_numberが空だと保存できないこと' do
        @user_buy.second_number = ''
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Second number can't be blank")
      end
      it 'telが空だと保存できないこと' do
        @user_buy.tel = ''
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telにはハイフン(-)があると保存できないこと' do
        @user_buy.tel = '090-1234-5678'
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include('Tel is invalid')
      end
      it 'telが11桁以内ではないと保存できないこと' do
        @user_buy.tel = '09012345678910'
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include('Tel is invalid')
      end
      it 'tokenが空だと保存できないこと' do
        @user_buy.token = nil
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
