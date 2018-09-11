User.destroy_all
Language.destroy_all
UserLanguage.destroy_all
Translation.destroy_all
Phrase.destroy_all

user_1 = User.create!(provider: 'google', uid: '47', name: "Billy Mays", oauth_token: '475', oauth_expires_at: '0')
user_2 = User.create!(provider: 'google', uid: '48', name: "Anthony Sullivan", oauth_token: '476', oauth_expires_at: '0')
user_3 = User.create!(provider: 'google', uid: '49', name: "Phil Swift", oauth_token: '477', oauth_expires_at: '0')
user_4 = User.create!(provider: 'google', uid: '50', name: "Vince with Shamwow", oauth_token: '478', oauth_expires_at: '0')
user_5 = User.create!(provider: 'google', uid: '51', name: "Swoos", oauth_token: '479', oauth_expires_at: '0')
language_1 = Language.create!(name: "Mandarin", abbreviation: 'zh')
language_2 = Language.create!(name: "German", abbreviation: 'de')
language_3 = Language.create!(name: "Spanish", abbreviation: 'es')

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
small_numbers = [13, 14, 15, 16, 17]
smaller_numbers = [18, 19, 20, 21, 22]

USERS = [user_1, user_2, user_3, user_4]
PHRASES = ["你在干嘛呢？", "我讨厌你全家", "那只鳄鱼会说俄语", "嚯嚯", "我是个蜜蜂", "起来不愿做奴隶的人民", "听妈妈的话吧", "月亮代表我的心", "嘻嘻嘻嘻嘻嘻", "我找不到家门钥匙", "闭上眼看 十六岁的夕阳 美得像我们一样", "瘦死的骆驼比马大"]
TRANSLATIONS = ["What're you doing?", "I have taken a disliking to your housepets", "The Crocodile can speak Russian", "Finance", "I'm a bee", "Rise up and face the day", "The Moon represents my heart", "I can't find my housekeys", "It's really good to hear your voice saying my name,
it sounds so sweet", "Coming from the lips of an angel", "Have you ever been alone in a crowded room?", "You got a fast car", "Is someone getting the best, the best, the best, the best, the best", "What're you doing?", "I have taken a disliking to your housepets", "The Crocodile can speak Russian", "Finance", "I'm a bee", "Rise up and face the day", "The Moon represents my heart", "I can't find my housekeys", "It's really good to hear your voice saying my name,
it sounds so sweet", "Coming from the lips of an angel", "Have you ever been alone in a crowded room?", "You got a fast car", "Is someone getting the best, the best, the best, the best, the best"]
GERMAN = ["Mein Herr, ich weiss wirklich nicht, warum der Präsident Frauenkleider anhatte!", "Warum kann ich keinen Fallschirm haben? Ich will sofort mit dem Piloten sprechen!", "Das nennen Sie ein Schinken-Sandwich? Nehmen Sie das sofort weg!", "Ist es der rote oder der grüne Knopf, der die Bombe entschärft?", "Drei von zwei Leuten haben Schwierigkeiten mit mathematischen Verhältnissen!"]
SPANISH = ["Mi hijo es un gángster sin corazón, y yo necesito un abrazo.", "El perro está el mejor amigo del hombre", "Vale, puedes quedarte a mi lado, siempre que no hables sobre la tempertura.", "Permítame presentarle a mi secretario.", "Hay ocho cientos alumnos en mi colegío."]


PHRASES.each do |phrase|
  Phrase.create!(body: phrase, language_id: 1)
  puts "Created #{phrase}"
end

GERMAN.each do |phrase|
  Phrase.create!(body: phrase, language_id: 2)
  puts "Created #{phrase}"
end

SPANISH.each do |phrase|
  Phrase.create!(body: phrase, language_id: 3)
  puts "Created #{phrase}"
end

USERS.each do |user|
  UserLanguage.create!(user_id: user.id, language_id: 1)
  shuffled = TRANSLATIONS.shuffle
  rand_tr = []
  n_shuffled = numbers.shuffle
  n_shuff = []
  10.times do
    rand_tr << shuffled.pop
    n_shuff << n_shuffled.pop
    user.translations.create!(phrase_id: n_shuff[-1], output: rand_tr[-1])
  end
end

USERS.each do |user|
  UserLanguage.create!(user_id: user.id, language_id: 2)
  shuffled = TRANSLATIONS.shuffle
  rand_tr = []
  n_shuffled = small_numbers.shuffle
  n_shuff = []
  5.times do
    rand_tr << shuffled.pop
    n_shuff << n_shuffled.pop
    user.translations.create!(phrase_id: n_shuff[-1], output: rand_tr[-1])
  end
end

USERS.each do |user|
  UserLanguage.create!(user_id: user.id, language_id: 3)
  shuffled = TRANSLATIONS.shuffle
  rand_tr = []
  n_shuffled = smaller_numbers.shuffle
  n_shuff = []
  5.times do
    rand_tr << shuffled.pop
    n_shuff << n_shuffled.pop
    user.translations.create!(phrase_id: n_shuff[-1], output: rand_tr[-1])
  end
end
