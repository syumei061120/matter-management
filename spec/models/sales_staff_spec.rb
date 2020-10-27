require 'rails_helper'

RSpec.describe SalesStaff, type: :model do
  describe '#create' do
    before do
      @sales_staff = FactoryBot.build(:sales_staff)
    end

    # 登録成功
    it "全ての情報が存在すれば登録できること" do
      expect(@sales_staff).to be_valid
    end

    # 部署・役職が入力できていない
    it "departmentが空では登録できないこと" do
      @sales_staff.department = nil
      @sales_staff.valid?
      expect(@sales_staff.errors.full_messages).to include("部署・役職を入力してください")
    end

    # 営業スタッフが入力できていない
    it "staffが空では登録できないこと" do
      @sales_staff.staff = nil
      @sales_staff.valid?
      expect(@sales_staff.errors.full_messages).to include("営業スタッフを入力してください")
    end
  end
end
