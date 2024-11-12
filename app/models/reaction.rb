class Reaction < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :like, inclusion: { in: [true, false] }  # Asegúrate de que "like" sea verdadero o falso
end
