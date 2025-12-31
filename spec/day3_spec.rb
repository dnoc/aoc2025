require 'spec_helper'

describe 'Day 3' do
  describe '.part_2' do
    it 'works for example 1' do
      batteries = ["9", "8", "7", "6", "5", "4", "3", "2", "1", "1", "1", "1", "1", "1", "1"]
      result = Day3.part_2(batteries)
      expect(result).to eq(987654321111)
    end

    it 'works for example 2' do
      batteries = ["8", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "9"]
      result = Day3.part_2(batteries)
      expect(result).to eq(811111111119)
    end

    it 'works for example 3' do
      batteries = ["2", "3", "4", "2", "3", "4", "2", "3", "4", "2", "3", "4", "2", "7", "8"]
      result = Day3.part_2(batteries)
      expect(result).to eq(434234234278)
    end

    it 'works for example 4' do
      batteries = ["8", "1", "8", "1", "8", "1", "9", "1", "1", "1", "1", "2", "1", "1", "1"]
      result = Day3.part_2(batteries)
      expect(result).to eq(888911112111)
    end
  end

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
      expect(result).to eq(3121910778619)
    end

    it 'works' do
      result = Day3.main
      expect(result).to eq(170025781683941)
    end
  end
end