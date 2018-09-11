FactoryBot.define do
  factory :user do
    provider { "google" }
    uid { "7" }
    name { "Bobby" }
    oauth_token { "oauth_token" }
    oauth_expires_at { "0" }
  end
end
