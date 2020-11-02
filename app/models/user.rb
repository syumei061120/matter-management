class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :user_image
  has_many :matter
  has_many :business_talk_record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :administrator

  name_validation = /\A[ぁ-んァ-ン一-龥]/
  name_kana_validation = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :family_name, format: { with: name_validation, message: 'は全角日本語で入力してください' }
    validates :first_name, format: { with: name_validation, message: 'は全角日本語で入力してください' }
    validates :family_name_kana, format: { with: name_kana_validation, message: 'は全角カタカナで入力してください' }
    validates :first_name_kana, format: { with: name_kana_validation, message: 'は全角カタカナで入力してください' }
    validates :administrator_id, numericality: { other_than: 0, message: 'は利用者or管理者を選択してください' }
  end
  validates :user_image, presence: { message: 'を設定してください' }
  validates_format_of :password, with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/, on: :create, message: 'は半角英語・数字を両方用いて入力して下さい'
end
