class JavaScriptViewFormatter
  attr_reader :article

  def initialize(article)
    @article = article
  end

  def format_for_javascript
    sentence_array = []
    article.each do |section|
      section.body.each do |sentence|
        sentence_hash = {}
        sentence_hash[:subheader] = section.subheader.strip.delete("= ")
        sentence_hash[:sentence] = sentence
        sentence_array << sentence_hash
      end
    end
    sentence_array
  end
end
