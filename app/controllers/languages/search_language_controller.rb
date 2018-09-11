class Languages::SearchLanguageController < ApplicationController
  def new
    @language = Language.find(params[:id])
  end

  def index
    @language = Language.find(params[:id])
    wiki = WikipediaArticlePresenter.new(@language.abbreviation, params[:phrase_search])
    if wiki.article != nil
      @article = wiki.article
    else
      flash[:notice] = "We're sorry! We couldn't find any results for that query; maybe try formatting it differently (capitalized, hyphenated, etc), or if you know the phrase in its native language, try that!"
      redirect_to "/languages/#{@language.id}/new" 
    end
  end
end
