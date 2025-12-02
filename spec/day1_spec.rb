require 'spec_helper'

describe 'Day 1' do
  describe '.move_dial' do
    it 'moves the dial left' do
      expect(Day1.move_dial(10, "L", 5)).to eq(5)
    end

    it 'moves the dial right' do
      expect(Day1.move_dial(10, "R", 5)).to eq(15)
    end

    it 'wraps around the dial when going below 0' do
      expect(Day1.move_dial(3, "L", 5)).to eq(98)
    end

    it 'wraps around the dial when going above 99' do
      expect(Day1.move_dial(98, "R", 5)).to eq(3)
    end

    it 'hits 0 on R' do
      expect(Day1.move_dial(98, "R", 2)).to eq(0)
    end

    it 'hits 0 on L' do
      expect(Day1.move_dial(10, "L", 10)).to eq(0)
    end

    it 'L100' do
      expect(Day1.move_dial(34, "L", 100)).to eq(34)
    end
    
    it 'R100' do
      expect(Day1.move_dial(34, "R", 100)).to eq(34)
    end

    it 'works over 100' do
      expect(Day1.move_dial(64, "L", 806)).to eq(58)
    end
  end

  describe '.main' do
    it 'works for small example' do
      commands = [
        { direction: 'L', distance: 68 },
        { direction: 'L', distance: 30 },
        { direction: 'R', distance: 48 },
        { direction: 'L', distance: 5 },
        { direction: 'R', distance: 60 },
        { direction: 'L', distance: 55 },
        { direction: 'L', distance: 1 },
        { direction: 'L', distance: 99 },
        { direction: 'R', distance: 14 },
        { direction: 'L', distance: 82 }
      ]
      allow(Day1).to receive(:get_commands).and_return(commands)
      result = Day1.main
      expect(result[:position]).to eq(32)
      expect(result[:zeroes_passed]).to eq(6469)
    end

    it 'works' do
      result = Day1.main
      expect(result[:position]).to eq(32)
      # expect(result[:zeroes_landed_on]).to eq(1026)
      expect(result[:zeroes_passed]).to eq(5923)
    end
  end
end