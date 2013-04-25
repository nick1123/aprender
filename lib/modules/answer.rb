class Answer
  attr_reader :successfully_matched, :text

  def initialize(_text)
    @text = _text
    @successfully_matched = false
  end

  def try_to_match(answer_text)
    @successfully_matched = true if answer_text == text
  end
end