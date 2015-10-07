class Zlorpian

  DECIMAL = "0123"
  ZLORPINUMERAL = "-|X#"
  BASE = ZLORPINUMERAL.size
  ZLORPINUMERAL_REGEX = Regexp.new(ZLORPINUMERAL.chars.map {|c| Regexp.escape(c) }.join("|"))
  ZLORPANESE = {
    "-" => "zlorp",
    "|" => "borp",
    "X" => "daborp",
    "#" => "traborp"
  }
  SUFFIXES = ["iffa", "onk", "en", "ity", ""]

  def zlorpinumeral(decimal)
    decimal.to_s(BASE).tr(DECIMAL, ZLORPINUMERAL)
  end

  def from_zloropinumeral(zlorpinumeral)
    zlorpinumeral.tr(ZLORPINUMERAL, DECIMAL).to_i(BASE)
  end

  def zlorpanese(decimal)
    z = zlorpinumeral(decimal)
    return ZLORPANESE[z] if decimal == 0
    result = ""
    z.chars.zip(SUFFIXES.last(z.size)).each do |digit, suffix|
      # the only time we should ever use "zlorp" is in the zero case
      next if digit == ZLORPINUMERAL[0] && decimal > 0
      result << ZLORPANESE[digit] << suffix
    end
    result
  end

end
