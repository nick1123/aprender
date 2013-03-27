class Answer
  attr_accessor :previously_selected
  attr_reader :text

  def initialize(_text)
    @text = _text
    @previously_selected = false
  end

  def to_s
    "Answer: #{text}  previously_selected: #{previously_selected}"
  end
end