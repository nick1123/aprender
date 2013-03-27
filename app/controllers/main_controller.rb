require "base64"

class String
  def encode_base64_url_safe
    Base64.urlsafe_encode64(self)
  end

  def decode_base64_url_safe
    Base64.urlsafe_decode64(self)
  end
end

class MainController < ApplicationController
  def usa_state_capitals
    @anchor_path = 'usa_state_capitals'
    session[:game] = ::Simple.usa_state_capitals if session[:game].blank?
    @game = session[:game]

    selected_answer = params["selected_answer"]
    selected_answer = selected_answer.decode_base64_url_safe if selected_answer.present?
    if selected_answer
      @game.add_answer(selected_answer)
    end

  end

end
