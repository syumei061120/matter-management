require 'rails_helper'

RSpec.describe Matter, type: :model do
  describe '#create' do
    before do
      @matter = FactoryBot.build(:matter)
    end

    # 登録成功
    it '全ての情報が存在すれば登録できること' do
      expect(@matter).to be_valid
    end
    it '案件詳細が空でも登録できること' do
      @matter.matter_explain = nil
      @matter.valid?
      expect(@matter).to be_valid
    end
   it '販売金額見込みが空でも登録できること' do
      @matter.sale_price = nil
      @matter.valid?
      expect(@matter).to be_valid
    end
   it '利益見込みが空でも登録できること' do
      @matter.profit_price = nil
      @matter.valid?
      expect(@matter).to be_valid
    end

    # 案件名が正しく入力できていない
    it 'matter_nameが空では登録できないこと' do
      @matter.matter_name = nil
      @matter.valid?
      expect(@matter.errors.full_messages).to include('案件名を入力してください')
    end

    # 商材が正しく入力できていない
    it 'productが空では登録できないこと' do
      @matter.product = nil
      @matter.valid?
      expect(@matter.errors.full_messages).to include('商材名を入力してください')
    end

    # 販売金額見込みが正しく入力できていない
    it 'sale_priceが英字では登録できないこと' do
      @matter.sale_price = 'abc'
      @matter.valid?
      expect(@matter.errors.full_messages).to include('販売金額見込みは数値で入力してください')
    end
    it 'sale_priceが漢字では登録できないこと' do
      @matter.sale_price = '山田'
      @matter.valid?
      expect(@matter.errors.full_messages).to include('販売金額見込みは数値で入力してください')
    end

    # 利益見込みが正しく入力できていない
    it 'profit_priceが英字では登録できないこと' do
      @matter.profit_price = 'abc'
      @matter.valid?
      expect(@matter.errors.full_messages).to include('利益見込みは数値で入力してください')
    end
    it 'profit_priceが漢字では登録できないこと' do
      @matter.profit_price = '山田'
      @matter.valid?
      expect(@matter.errors.full_messages).to include('利益見込みは数値で入力してください')
    end

    # 販売見込み時期が入力できていない
    it 'sale_timeが空では登録できないこと' do
      @matter.sale_time = nil
      @matter.valid?
      expect(@matter.errors.full_messages).to include('販売見込みを入力してください')
    end

    # 重点度が正しく入力できていない
    it 'priority_idが空では登録できないこと' do
      @matter.priority_id = nil
      @matter.valid?
      expect(@matter.errors.full_messages).to include('重点度を入力してください')
    end
    it 'priority_idが0では登録できないこと' do
      @matter.priority_id = 0
      @matter.valid?
      expect(@matter.errors.full_messages).to include('重点度を選択してください')
    end
    it 'priority_idが英語では登録できないこと' do
      @matter.priority_id = 'abc'
      @matter.valid?
      expect(@matter.errors.full_messages).to include('重点度を選択してください')
    end

    # 確度が正しく入力できていない
    it 'reliability_idが空では登録できないこと' do
      @matter.reliability_id = nil
      @matter.valid?
      expect(@matter.errors.full_messages).to include('確度を入力してください')
    end
    it 'reliability_idが0では登録できないこと' do
      @matter.reliability_id = 0
      @matter.valid?
      expect(@matter.errors.full_messages).to include('確度を選択してください')
    end
    it 'reliability_idが英語では登録できないこと' do
      @matter.reliability_id = 'abc'
      @matter.valid?
      expect(@matter.errors.full_messages).to include('確度を選択してください')
    end

    # 進捗が正しく入力できていない
    it 'progress_idが空では登録できないこと' do
      @matter.progress_id = nil
      @matter.valid?
      expect(@matter.errors.full_messages).to include('進捗を入力してください')
    end
    it 'progress_idが0では登録できないこと' do
      @matter.progress_id = 0
      @matter.valid?
      expect(@matter.errors.full_messages).to include('進捗を選択してください')
    end
    it 'progress_idが英語では登録できないこと' do
      @matter.progress_id = 'abc'
      @matter.valid?
      expect(@matter.errors.full_messages).to include('進捗を選択してください')
    end

    # きっかけが正しく入力できていない
    it 'occasionが空では登録できないこと' do
      @matter.occasion = nil
      @matter.valid?
      expect(@matter.errors.full_messages).to include('きっかけを入力してください')
    end

    # 担当者が正しく入力できていない
    it 'staff_in_chargeが空では登録できないこと' do
      @matter.staff_in_charge = nil
      @matter.valid?
      expect(@matter.errors.full_messages).to include('担当者を入力してください')
    end
  end
end
