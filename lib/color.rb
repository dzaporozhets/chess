module Color
  def colorize(text, color_code)
    "\033[#{color_code}#{text}\033[0m"
  end

  def red(text)
    colorize(text, "31m")
  end

  def black(text)
    colorize(text, "30m")
  end

  def green(text)
    colorize(text, "32m")
  end

  def gray(text)
    colorize(text, "90m")
  end

  def gray_bg(text)
    colorize(text, "100m")
  end
end
