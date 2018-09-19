module ApplicationHelper
  def language_select
    Language.all.reduce([]) do |sum, lang|
      sum << [lang.name, lang.id]
      sum
    end
  end
end
