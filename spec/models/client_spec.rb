require 'rails_helper'

RSpec.describe Client, type: :model do
  describe '#create' do
    before do
      @client = FactoryBot.build(:client)
    end

    # 登録成功
    it '全ての情報が存在すれば登録できること' do
      expect(@client).to be_valid
    end

    # 会社名が入力できていない
    it 'companyが空では登録できないこと' do
      @client.company = nil
      @client.valid?
      expect(@client.errors.full_messages).to include('会社名を入力してください')
    end

    # 部署・役職が入力できていない
    it 'departmentが空では登録できないこと' do
      @client.department = nil
      @client.valid?
      expect(@client.errors.full_messages).to include('部署・役職を入力してください')
    end

    # 担当者が入力できていない
    it 'nameが空では登録できないこと' do
      @client.name = nil
      @client.valid?
      expect(@client.errors.full_messages).to include('担当者を入力してください')
    end
  end
end
