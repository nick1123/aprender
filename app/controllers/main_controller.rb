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

    if session[:game].blank?
      game_builder = ::Simple.new
      session[:game] = game_builder.usa_state_capitals 
    end

    game = session[:game]

    @answered_correctly = nil
    selected_answer = params["selected_answer"]
    if selected_answer.present?
      selected_answer_decoded = selected_answer.decode_base64_url_safe 
      @answered_correctly = game.answered_correctly?(selected_answer_decoded)
    end

    @round = game.current_round
    @questions_remaining = game.questions_remaining
  end

end
