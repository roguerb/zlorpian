class Zlorpian

  DECIMAL = "0123"
  ZLORPINUMERAL = "-|X#"
  BASE = ZLORPINUMERAL.size

  def zlorpinumeral(decimal)
    decimal.to_s(BASE).tr(DECIMAL, ZLORPINUMERAL)
  end

  def from_zloropinumeral(zlorpinumeral)
    zlorpinumeral.tr(ZLORPINUMERAL, DECIMAL).to_i(BASE)
  end

  def zlorpanese(decimal)
    return ""
  end

end
