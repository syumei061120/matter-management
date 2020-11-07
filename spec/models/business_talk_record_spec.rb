require 'rails_helper'

RSpec.describe BusinessTalkRecord, type: :model do
  describe '#create' do
    before do
      @business_talk_record = FactoryBot.build(:business_talk_record)
    end
    # 登録成功
    it '全ての情報が存在すれば登録できること' do
      expect(@business_talk_record).to be_valid
    end

    it '商談資料がない場合も登録できること' do
      @business_talk_record.files = nil
      expect(@business_talk_record).to be_valid
    end

    # 開始時刻が入力できていない
    it 'start_timeが空では登録できないこと' do
      @business_talk_record.start_time = nil
      @business_talk_record.valid?
      expect(@business_talk_record.errors.full_messages).to include('開始時刻を設定してください')
    end

    # 終了時刻が入力できていない
    it 'end_timeが空では登録できないこと' do
      @business_talk_record.end_time = nil
      @business_talk_record.valid?
      expect(@business_talk_record.errors.full_messages).to include('終了時刻を設定してください')
    end

    # 商談内容が入力できていない
    it 'explainが空では登録できないこと' do
      @business_talk_record.explain = nil
      @business_talk_record.valid?
      expect(@business_talk_record.errors.full_messages).to include('商談内容を入力してください')
    end
  end
end
