class Admin < ApplicationRecord
  has_many_attached :files

  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
