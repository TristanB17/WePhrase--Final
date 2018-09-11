class Languages::SearchLanguageController < ApplicationController
  def new
    @language = Language.find(params[:id])
  end

  def index
    @language = Language.find(params[:id])
    wiki = WikipediaArticlePresenter.new(@language.abbreviation, params[:phrase_search])
    @article = wiki.article
  end
end
