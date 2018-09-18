class Phrase < ApplicationRecord
  belongs_to :language
  has_many :translations, dependent: :destroy
  has_many :users, through: :translations

  def others?(id)
    translations.where.not(user_id: id).empty?
  end

  def others(id)
    translations.where.not(user_id: id)
  end

  def self.other_others(id)
    translations.where.not(user_id: id).sort_by do |tran|
      tran.votes_for.size
    end.reverse
  end

end
