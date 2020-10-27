class Matter < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :sales_staff, optional: true
  has_many   :clients, through: :matter_clients
  has_many   :matter_clients

  with_options presence: true do
    validates :matter_name
    validates :product
    validates :priority_id, numericality: { other_than: 0, message: 'を選択してください'}
    validates :reliability_id, numericality: { other_than: 0, message: 'を選択してください'}
    validates :progress_id, numericality: { other_than: 0, message: 'を選択してください'}
    validates :occasion
    validates :staff_in_charge
  end
  
  validates :sale_price, numericality: { only_integer: true }, allow_blank: true
  validates :profit_price, numericality: { only_integer: true }, allow_blank: true

end