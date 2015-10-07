require "bundler/inline"
require_relative "zlorpian"

gemfile do
  gem 'rspec'
end

RSpec.describe Zlorpian do

  context "zlorpinumeral" do
    [
      [0, "-"],
      [1, "|"],
      [2, "X"],
      [3, "#"],
      [4, "|-"],
      [5, "||"],
      [15, "##"],
      [16, "|--"],
      [17, "|-|"],
      [200, "#-X-"],
      [221, "#|#|"],
      [237, "#X#|"],
      [1001, "##XX|"]
    ].each do |(input, output)|
      it "converts #{input} to #{output}" do
        expect(subject.zlorpinumeral(input)).to eq output
      end

      it "converts #{output} to #{input}" do
        expect(subject.from_zloropinumeral(output)).to eq input
      end
    end
  end

  #  16's  |  12's |  8's |  4's | 1's
  # "iffa" | "onk" | "en" | "ity" | num
  context "zlorpanese" do
    [
      [0, "zlorp"],
      [1, "borp"],
      [2, "daborp"],
      [3, "traborp"],
      [4, "borpity"],
      [5, "borpityborp"],
      [6, "borpitydaborp"],
      [7, "borpitytraborp"],
      [8, "daborpity"],
      [9, "daborpityborp"],
      [10, "daborpitydaborp"],
      [15, "traborpitytraborp"],
      [16, "borpen"],
      [17, "borpenborp"],
      [21, "borpenborpityborp"],
      [200, "traborponkdaborpity"],
      [221, "traborponkborpentraborpityborp"],
      [237, "traborponkdaborpentraborpityborp"],
      [1001, "traborpiffatraborponkdaborpendaborpityborp"],
    ].each do |(input, output)|
      it "converts #{input} to #{output}" do
        expect(subject.zlorpanese(input)).to eq output
      end
    end
  end

end
