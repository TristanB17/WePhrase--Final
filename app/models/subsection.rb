require 'pragmatic_segmenter'

class Subsection
  attr_reader :subheader, :body, :target_language

  def initialize(article_info, target_language = nil)
    @subheader = article_info[:header]
    @target_language = target_language
    @body = test_parser(article_info[:body])
  end

  def test_parser(sentences)
    if sentences.class == String
      ps = PragmaticSegmenter::Segmenter.new(text: sentences, language: target_language)
      ps.segment.map do |segment|
        segment.delete('"').gsub(Regexp.union(['[0]', '[1]', '[2]', '[3]', '[4]', '[5]', '[6]', '[7]', '[8]', '[9]']), '')
      end
    else sentences.class == Array
      sentences.map do |clear_out|
        clear_out.delete("{").delete("}").delete("\\")
      end
    end
  end
end
