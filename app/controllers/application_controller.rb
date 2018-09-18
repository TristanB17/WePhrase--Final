class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def check_phrase(phrase)
    if phrase == nil
      @phrase = @language.phrases.create(
        body: params[:sentence],
        subject: params[:keyword],
        focus: params[:subheader],
        computer_translation: YandexTranslatorService.new(@language.abbreviation, params[:sentence]).translate_from_target
      )
      @translation = @phrase.translations.create(
        output: params[:user_translation],
        user_id: current_user.id
      )
      render partial: 'successful_translation_submitted'
    elsif phrase.translations.where(user_id: current_user.id).empty?
      @phrase = phrase
      @translation = @phrase.translations.create(output: params[:user_translation], user_id: current_user.id)
      render partial: 'successful_translation_submitted'
    else
      render partial: 'already_translated'
    end
  end
end
