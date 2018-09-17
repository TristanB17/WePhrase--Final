class Languages::SearchLanguageController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :set_language

  def new
  end

  def index
    @keyword = params[:phrase_search]
    wiki = WikipediaArticlePresenter.new(@language.abbreviation, params[:phrase_search])
    if wiki.article != nil
      article_as_objects = wiki.article
      hash_object_array = JavaScriptViewFormatter.new(article_as_objects)
      @article = hash_object_array.format_for_javascript
    else
      flash[:notice] = "We're sorry! We couldn't find any results for that query; maybe try formatting it differently (capitalized, hyphenated, etc), or if you know the phrase in its native language, try that!"
      redirect_to "/languages/#{@language.id}/search/new"
    end
  end

  def create
    @phrase = @language.phrases.find_or_create_by(body: params[:sentence], subject: params[:keyword], focus: params[:subheader], computer_translation: YandexTranslatorService.new(@language.abbreviation, params[:sentence]).translate_from_target)
    @translation = @phrase.translations.create(output: params[:user_translation], user_id: current_user.id)
    if @phrase != nil && @translation != nil
      render partial: 'successful_translation_submitted'
    end
  end

  private
  def set_language
    @language = Language.find(params[:id])
  end
end
