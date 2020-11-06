class Reliability < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '0%' },
    { id: 2, name: '20%' },
    { id: 3, name: '40%' },
    { id: 4, name: '60%' },
    { id: 5, name: '80%' },
    { id: 6, name: '100%' }
  ]
end
