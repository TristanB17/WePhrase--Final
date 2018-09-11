class HomeController < ApplicationController
  def show
    @languages = Language.all
  end
end
