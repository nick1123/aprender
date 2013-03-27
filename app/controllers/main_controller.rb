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
    puts "\n\n*****************************\n\n"
    puts "*** params #{params.inspect}"

    @anchor_path = 'usa_state_capitals'
    if session[:current_game].nil? || params['start_over'].present?
      session[:current_game] = ::Simple.usa_state_capitals
    end

    @game = session[:current_game]
    puts "*** @game.object_id #{@game.object_id}"

    selected_answer = params["selected_answer"]
    selected_answer = selected_answer.decode_base64_url_safe if selected_answer.present?
    if selected_answer
      puts "*** selected_answer: #{selected_answer}"
      @game.add_answer(selected_answer)
    end

  end

end
