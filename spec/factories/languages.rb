FactoryBot.define do
  factory :language do
    name { "Mandarin" }
    abbreviation { "zh" }

    factory :language_2 do
      name { "German" }
      abbreviation { "de" }
    end
  end
end
