class User < ApplicationRecord

  has_many :user_languages
  has_many :translations
  has_many :phrases, through: :translations
  has_many :languages, through: :user_languages

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.first_name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.translation_api_key = ENV['TRANSLATOR_API_KEY']
      user.save!
    end
  end
end
