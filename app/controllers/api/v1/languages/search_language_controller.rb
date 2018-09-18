class Api::V1::Languages::SearchLanguageController < ApplicationController
  before_action :set_language
  def new
    # @language = Language.find(params[:id])
  end

  def index
    # @language = Language.find(params[:id])
    wiki = WikipediaArticlePresenter.new(@language.abbreviation, params[:phrase_search])
    if wiki.article != nil
      @article = wiki.article
    else
      flash[:notice] = "We're sorry! We couldn't find any results for that query; maybe try formatting it differently (capitalized, hyphenated, etc), or if you know the phrase in its native language, try that!"
      redirect_to "/languages/#{@language.id}/search/new"
    end
  end

  def create
    # language = Language.find(params[:id])
    @phrase = @language.phrases.find_or_create_by(body: params[:article_sentence], computer_translation: YandexTranslatorService.new(@language.abbreviation, params[:article_sentence]).translate_from_target)
    @translation = @phrase.translations.create(output: params[:user_translation], user_id: current_user.id)
  end

  private
  def set_language
    @language = Language.find(params[:id])
  end
end
