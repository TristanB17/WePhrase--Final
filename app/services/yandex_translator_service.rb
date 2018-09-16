class YandexTranslatorService
  attr_reader :abbreviation, :text

  def initialize(abbreviation, text)
    @abbreviation = abbreviation
    @text = text
  end

  def translate_to_target
    get_json("/api/v1.5/tr.json/translate?key=#{ENV['TRANSLATOR_API_KEY']}&text=#{text}&lang=en-#{abbreviation}")
  end

  def translate_from_target
    get_json("/api/v1.5/tr.json/translate?key=#{ENV['TRANSLATOR_API_KEY']}&text=#{text}&lang=#{abbreviation}-en")
  end

  private
  def conn
    Faraday.new("https://translate.yandex.net") do |faraday|
      faraday.adapter(Faraday.default_adapter)
    end
  end

  def get_json(url)
    entire_uri = Addressable::URI.parse(url).normalize
    JSON.parse(conn.get(entire_uri).body, symbolize_names: true)[:text]
  end
end
