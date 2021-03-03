class Command
  def validate(_params)
    'Not Implemented Yet'
  end

  def execute(_params)
    'Not Implemented Yet'
  end

  def num?(string)
    if string[0] == '-'
      string[1...string.length].scan(/\D/).empty?
    else
      string.scan(/\D/).empty?
    end
  end
end
