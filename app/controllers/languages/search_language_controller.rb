class Languages::SearchLanguageController < ApplicationController
  before_action :set_language

  def new
  end

  def index
    wiki = WikipediaArticlePresenter.new(@language.abbreviation, params[:phrase_search])
    if wiki.article != nil
      article_as_objects = wiki.article
      hash_object_array = JavaScriptViewFormatter.new(article_as_objects)
      working = hash_object_array.format_for_javascript
      @article = working
      @barnacle = working.to_json
      @carmichael = JSON.parse(working.to_json)
    else
      flash[:notice] = "We're sorry! We couldn't find any results for that query; maybe try formatting it differently (capitalized, hyphenated, etc), or if you know the phrase in its native language, try that!"
      redirect_to "/languages/#{@language.id}/search/new"
    end
  end

  def create
    @phrase = @language.phrases.find_or_create_by(body: params[:article_sentence], computer_translation: YandexTranslatorService.new(@language.abbreviation, params[:article_sentence]).translate_from_target)
    @translation = @phrase.translations.create(output: params[:user_translation], user_id: current_user.id)
  end

  private
  def set_language
    @language = Language.find(params[:id])
  end
end
