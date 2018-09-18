class Language < ApplicationRecord
  has_many :phrases
  has_many :user_languages
  has_many :users, through: :user_languages

  def self.has_language?(code)
    Language.pluck(:abbreviation).include?(code)
  end

  def self.valid_languages
    {
      "Azerbaijan": "az",
      "Malayalam": "ml",
      "Albanian":	"sq",
      'Maltese':	'mt',
      'Amharic':	'am',
      'Arabic':	'ar',
      'Swahili': 'sw'
    }
  end

  def valid_languages
    {
      "Azerbaijan": "az",
      "Malayalam": "ml",
      "Albanian":	"sq",
      'Maltese':	'mt',
      'Amharic':	'am',
      'Arabic':	'ar',
      'Swahili': 'sw'
    }
  end

  def self.language_valid?(code)
    valid_languages.values.include?(code)
  end

  def self.make_language_hash(lang_code)
    if language_valid?(lang_code) && Language.has_language?(lang_code) == false
      lang_name = valid_languages.invert[lang_code]
      {
        name: lang_name,
        abbreviation: valid_languages[lang_name]
      }
    else
      'pls no'
    end
  end
end

# Macedonian	mk
# English	en
# Maori	mi
# Marathi	mr
# Armenian	hy
# Mari	mhr
# Afrikaans	af
# Mongolian	mn
# Basque	eu
# German	de
# Bashkir	ba
# Nepali	ne
# Belarusian	be
# Norwegian	no
# Bengali	bn
# Punjabi	pa
# Burmese	my
# Papiamento	pap
# Bulgarian	bg
# Persian	fa
# Bosnian	bs
# Polish	pl
# Welsh	cy
# Portuguese	pt
# Hungarian	hu
# Romanian	ro
# Vietnamese	vi
# Russian	ru
# Haitian (Creole)	ht
# Cebuano	ceb
# Galician	gl
# Serbian	sr
# Dutch	nl
# Sinhala	si
# Hill Mari	mrj
# Slovakian	sk
# Greek	el
# Slovenian	sl
# Georgian	ka
# Gujarati	gu
# Sundanese	su
# Danish	da
# Tajik	tg
# Hebrew	he
# Thai	th
# Yiddish	yi
# Tagalog	tl
# Indonesian	id
# Tamil	ta
# Irish	ga
# Tatar	tt
# Italian	it
# Telugu	te
# Icelandic	is
# Turkish	tr
# Spanish	es
# Udmurt	udm
# Kazakh	kk
# Uzbek	uz
# Kannada	kn
# Ukrainian	uk
# Catalan	ca
# Urdu	ur
# Kyrgyz	ky
# Finnish	fi
# Chinese	zh
# French	fr
# Korean	ko
# Hindi	hi
# Xhosa	xh
# Croatian	hr
# Khmer	km
# Czech	cs
# Laotian	lo
# Swedish	sv
# Latin	la
# Scottish	gd
# Latvian	lv
# Estonian	et
# Lithuanian	lt
# Esperanto	eo
# Luxembourgish	lb
# Javanese	jv
# Malagasy	mg
# Japanese	ja
# Malay	ms
