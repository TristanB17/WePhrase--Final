class LanguagesController < ApplicationController
  def show
    @language = Language.find(params[:id])
  end

  def index
    @language = Language.find(params[:language])
  end
end
