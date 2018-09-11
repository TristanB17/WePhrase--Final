class Translation < ApplicationRecord
  belongs_to :phrase
  belongs_to :user
end
