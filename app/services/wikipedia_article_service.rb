require 'addressable/template'

class WikipediaArticleService
  attr_reader :abbreviation, :search_word

  def initialize(abbreviation, search_word)
    @abbreviation = abbreviation
    @search_word = search_word
  end

  def retrieve_article
    get_json("/w/api.php?action=query&prop=extracts&format=json&exsectionformat=wiki&explaintext=true&titles=#{search_word}")
  end

  private
  def conn
    Faraday.new("https://#{abbreviation}.wikipedia.org") do |faraday|
      faraday.adapter(Faraday.default_adapter)
    end
  end

  def get_json(url)
    entire_uri = Addressable::URI.parse(url).normalize
    all = JSON.parse(conn.get(entire_uri).body, symbolize_names: true)
    page_number = all[:query][:pages].keys.first
    all[:query][:pages][page_number][:extract]
  end
end
