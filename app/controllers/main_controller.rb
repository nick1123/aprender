class MainController < ApplicationController
  def usa_state_capitals
    session[:game] = ::Simple.usa_state_capitals if session[:game].blank?
    game = session[:game]
  end

end
