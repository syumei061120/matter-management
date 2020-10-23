class Administrator < ActiveHash::Base
  self.data = [
    { id: 0, name: '--'},
    { id: 1, name: '利用者'},
    { id: 2, name: '管理者'}
  ]
end
