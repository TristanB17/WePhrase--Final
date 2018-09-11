class Subsection
  attr_reader :subheader, :body

  def initialize(article_info)
    @subheader = article_info[:header]
    @body = split_sentences(article_info[:body])
  end

  def split_sentences(sentences)
    sentences.map.with_index do |sentence, index|
      if sentences[index + 1] != nil && sentences[index + 2] != nil && sentences[index + 1].length == 1
        concatted = sentence << sentences[index + 1] << " " << sentences[index + 2]
        sentences.delete_at(index + 1)
        sentences.delete_at(index + 1)
        concatted
      else
        sentence
      end
    end
  end
end
