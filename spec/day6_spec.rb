require 'spec_helper'

describe 'Day 6' do
  describe '.main' do
    xcontext 'part 1' do
      it 'works for small example' do
        lines = [
          ["123", "328", "51", "64"],
          ["45", "64", "387", "23"],
          ["6", "98", "215", "314"],
          ["*", "+", "*", "+"],
        ]
        allow(Day6).to receive(:get_lines).and_return(lines)
        result = Day6.main
        expect(result).to eq(4277556)
      end

      it 'works' do
        result = Day6.main
        expect(result).to eq(4405895212738)
      end
    end

    context 'part 2' do
      it 'works for small example' do
        lines = [
          "123 328  51 64 ",
          " 45 64  387 23 ",
          "  6 98  215 314",
          "*   +   *   +  ",
        ]
        allow(Day6).to receive(:read_file).and_return(lines)
        result = Day6.main
        expect(result).to eq(3263827)
      end

      it 'works' do
        result = Day6.main
        expect(result).to eq(7450962489289)
      end
    end
  end
end