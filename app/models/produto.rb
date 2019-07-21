class Produto < ApplicationRecord
  validates :preco, presence: true
  validates :nome, length: { minimum: 4 }

end
