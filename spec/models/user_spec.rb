require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    # 登録成功
    it "全ての情報が存在すれば登録できること" do
      expect(@user).to be_valid
    end

    # 姓名が正しく入力できていない
    it "family_nameが空では登録できないこと" do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("姓を入力してください")
    end
    it "family_nameが半角英語では登録できないこと" do
      @user.family_name = "yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("姓は全角日本語で入力してください")
    end
    it "first_nameが空では登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("名を入力してください")
    end
    it "first_nameが半角英語では登録できないこと" do
      @user.first_name = "taro"
      @user.valid?
      expect(@user.errors.full_messages).to include("名は全角日本語で入力してください")
    end

    # 姓名（カナ）が正しく入力できていない
    it "family_name_kanaが空では登録できないこと" do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("姓（カナ）を入力してください")
    end
    it "family_name_kanaが漢字では登録できないこと" do
      @user.family_name_kana = "山田"
      @user.valid?
      expect(@user.errors.full_messages).to include("姓（カナ）は全角カタカナで入力してください")
    end
    it "family_name_kanaが半角英語では登録できないこと" do
      @user.family_name_kana = "yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("姓（カナ）は全角カタカナで入力してください")
    end
    it "first_name_kanaが空では登録できないこと" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("名（カナ）を入力してください")
    end
    it "first_name_kanaが漢字では登録できないこと" do
      @user.first_name_kana = "太郎"
      @user.valid?
      expect(@user.errors.full_messages).to include("名（カナ）は全角カタカナで入力してください")
    end
    it "first_name_kanaが半角英語では登録できないこと" do
      @user.first_name_kana = "taro"
      @user.valid?
      expect(@user.errors.full_messages).to include("名（カナ）は全角カタカナで入力してください")
    end

    # メールアドレスが正しく入力できていない
    it 'emailが空だと保存できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
    end
    it 'emailに＠が含まれていないと保存できないこと' do
      @user.email = 'testtest.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスは不正な値です")
    end
    it 'emailが重複していると保存できないこと' do
      @user.save
      user2 = FactoryBot.build(:user, email: @user.email)
      user2.valid?
      expect(user2.errors.full_messages).to include("メールアドレスはすでに存在します")
    end

    # パスワードが正しく入力できていない
    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    it "passwordが6文字以下では登録できないこと" do
      @user.password = "pass1"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end
    it "passwordが数字のみでは登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは半角英語・数字を両方用いて入力して下さい")
    end
    it "passwordが英語のみでは登録できないこと" do
      @user.password = "abcdef"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは半角英語・数字を両方用いて入力して下さい")
    end
    it "password_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it "passwordとpassword_confirmationが一致しないと登録できないこと" do
      @user.password_confirmation = "password123"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    # 権限が正しく選択できていない
    it "administrator_idが空では登録できないこと" do
      @user.administrator_id = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("権限を入力してください")
    end
    it "administrator_idが0では登録できないこと" do
      @user.administrator_id = "0"
      @user.valid?
      expect(@user.errors.full_messages).to include("権限は利用者or管理者を選択してください")
    end

    # 画像が正しく入力できていない
    it "user_imageが0では登録できないこと" do
      @user.user_image = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("アイコン画像を設定してください")
    end
  end
end