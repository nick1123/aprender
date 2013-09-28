class Answer
  attr_reader :text

  def initialize(_text)
    @text = _text
  end

  def to_s
    return text
  end
end
