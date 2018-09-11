class WikipediaArticlePresenter
  attr_reader :service, :search_word

  def initialize(abbreviation, search_text)
    @search_word = YandexTranslatorService.new(abbreviation, search_text)
    @service = WikipediaArticleService.new(abbreviation, @search_word.translate.first)
  end

  def article
    unparsed = @service.retrieve_article
    if unparsed == "" || unparsed == nil
      return "Sorry, couldn't find anything for that query, maybe try formatting it differently (capitalized, hyphenated, etc)?"
    elsif unparsed.include?("。")
      get_parsed = WikipediaArticleParser.new(unparsed.split("=="))
      get_parsed.mandarin_parse_now
    else
      get_parsed = WikipediaArticleParser.new(unparsed.split("=="))
      get_parsed.parse_now
    end
  end
end
