class Phrase < ApplicationRecord
  belongs_to :language
  has_many :translations, dependent: :destroy
  has_many :users, through: :translations
end
