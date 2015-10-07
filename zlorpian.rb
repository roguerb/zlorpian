class Zlorpian

  DECIMAL = "0123"
  ZLORPINUMERAL = "-|X#"
  ZLORPANESE = %w[zlorp borp daborp traborp]
  SUFFIXES = %w[iffa onk en ity] + [""]
  BASE = ZLORPINUMERAL.size
  ZLORPINUMERAL_REGEX = Regexp.new(ZLORPINUMERAL.chars.map {|c| Regexp.escape(c) }.join("|"))

  def zlorpinumeral(decimal)
    zlorpibase(decimal).tr(DECIMAL, ZLORPINUMERAL)
  end

  def zlorpibase(decimal)
    decimal.to_s(BASE)
  end

  def from_zloropinumeral(zlorpinumeral)
    zlorpinumeral.tr(ZLORPINUMERAL, DECIMAL).to_i(BASE)
  end

  def zlorpanese(decimal)
    return ZLORPANESE.first if decimal.zero?
    digits = zlorpibase(decimal)
    digits.chars.map(&:to_i).zip(SUFFIXES.last(digits.size)).each_with_object("") do |(digit, suffix), result|
      # the only time we should ever use "zlorp" is in the zero case
      next if digit.zero?
      result << ZLORPANESE[digit] << suffix
    end
  end

end
