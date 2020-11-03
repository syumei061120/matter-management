class BusinessTalkRecord < ApplicationRecord
  has_many_attached :files
  belongs_to :user
  belongs_to :matter

  with_options presence: { message: 'を設定してください' }do
    validates :start_time
    validates :end_time
  end
  validates :explain, presence: true 
end
