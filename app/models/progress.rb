class Progress < ApplicationRecord
  self.data =[
    {id: 0, name: '--' }
    {id: 1, name: '引き合い' }
    {id: 2, name: '提案中' }
    {id: 3, name: 'トライアル' }
    {id: 4, name: 'お客様検討中' }
    {id: 5, name: '受注' }
    {id: 6, name: '失注' }
  ]
end
