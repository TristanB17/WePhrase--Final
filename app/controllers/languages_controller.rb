class LanguagesController < ApplicationController
  def show
    @language = Language.find(params[:id])
  end

  def index
    @languages = Language.all
  end

  def new
  end

  def create
    new_lang = Language.make_language_hash(params[:language_abbreviation])
    if new_lang.class == Hash
      Language.create(name: new_lang[:name], abbreviation: new_lang[:abbreviation])
      redirect_to language_path(Language.last.id)
    else
      redirect_to new_language_path
      flash[:message] = "Invalid"
    end
  end
end
