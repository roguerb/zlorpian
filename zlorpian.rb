class Zlorpian

  def zlorpinumeral(decimal)
    decimal.to_s(4).tr("0123", "-|X#")
  end

  def from_zloropinumeral(zlorpinumeral)
    zlorpinumeral.tr("-|X#", "0123").to_i(4)
  end

  def zlorpanese(decimal)
    return ""
  end

end
