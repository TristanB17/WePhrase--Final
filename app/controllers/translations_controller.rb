class TranslationsController < ApplicationController

  def upvote
    @translation = Translation.find(params[:id])
    @translation.upvote_from current_user
    redirect_back(fallback_location: params[:url])
  end
end
