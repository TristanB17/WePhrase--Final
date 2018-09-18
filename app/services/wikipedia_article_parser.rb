class WikipediaArticleParser
  attr_reader :unparsed_text, :target_language

  def initialize(unparsed_text, target_language = nil)
    @unparsed_text = unparsed_text
    @target_language = target_language
  end

  def parse_now
    semi_parsed = []
    unparsed_text.each_with_index do |slab, index|
      if index == 0
        unparsed_hash = {}
        unparsed_hash[:header] = "overview"
        unparsed_hash[:body] = slab.delete("\n")
        semi_parsed << unparsed_hash
      elsif slab.length < 40 && unparsed_text[index + 1] != nil && unparsed_text[index + 1].length > 70
        unparsed_hash = {}
        unparsed_hash[:header] = slab
        unparsed_hash[:body] = unparsed_text[index + 1].delete("\n")
        semi_parsed << unparsed_hash
      else
        semi_parsed << nil
      end
    end
    semi_parsed.compact.map do |section|
      Subsection.new(section, target_language)
    end
  end

  def mandarin_parse_now
    semi_parsed = []
    unparsed_text.each_with_index do |slab, index|
      if index == 0
        unparsed_hash = {}
        unparsed_hash[:header] = "overview"
        unparsed_hash[:body] = slab.delete("\n").split("。")
        semi_parsed << unparsed_hash
      elsif slab.length < 40 && unparsed_text[index + 1] != nil && unparsed_text[index + 1].length > 70
        unparsed_hash = {}
        unparsed_hash[:header] = slab
        unparsed_hash[:body] = unparsed_text[index + 1].delete("\n").split("。")
        semi_parsed << unparsed_hash
      else
        semi_parsed << nil
      end
    end
    semi_parsed.compact.map do |section|
      Subsection.new(section)
    end
  end
end
