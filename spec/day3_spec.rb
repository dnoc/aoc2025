require 'spec_helper'

describe 'Day 3' do
  describe '.main' do
    it 'works for small example' do
      banks = [
        ["9", "8", "7", "6", "5", "4", "3", "2", "1", "1", "1", "1", "1", "1", "1"],
        ["8", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "9"],
        ["2", "3", "4", "2", "3", "4", "2", "3", "4", "2", "3", "4", "2", "7", "8"],
        ["8", "1", "8", "1", "8", "1", "9", "1", "1", "1", "1", "2", "1", "1", "1"]
      ]
      allow(Day3).to receive(:get_battery_banks).and_return(banks)
      result = Day3.main
      expect(result).to eq(357)
    end

    it 'works' do
      result = Day3.main
      expect(result).to eq(17179)
    end
  end
end