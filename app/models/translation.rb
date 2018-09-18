class Translation < ApplicationRecord
  belongs_to :phrase
  belongs_to :user

  acts_as_votable
end
