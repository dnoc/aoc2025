require 'spec_helper'

describe 'Day 5' do
  
  describe '.part_1' do
    it 'works for small example' do
      fresh_ids = [
        [3, 5],
        [10, 14],
        [16, 20],
        [12, 18]
      ]
      ingredient_ids = [1, 5, 8, 11, 17, 32]
      expect(Day5.part_1(fresh_ids, ingredient_ids)).to eq(3)
    end

    it 'works for full example' do
      lines = Day5.read_file
      expect(Day5.part_1(lines[:fresh_ids], lines[:ingredient_ids])).to eq(694)
    end
  end

  describe '.part_2' do
    it 'works for small example' do
      fresh_ids = [
        [3, 5],
        [10, 14],
        [16, 20],
        [12, 18]
      ]
      expect(Day5.part_2(fresh_ids)).to eq(14)
    end

    # Too low:            299110025652044
    # Too low (cloned):   345668364197731
    # Too low(uniq):      328780761302682
    # Too high (sorted):  355635148426629
    it 'works for full example' do
      lines = Day5.read_file
      expect(Day5.part_2(lines[:fresh_ids])).to eq(352716206375547)
    end
  end
end