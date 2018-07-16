require 'bowling_kata'

describe Bowling do
  let(:bowling) { Bowling.new }
  describe 'can return a total score' do
    it 'returns 0 with 0 pins struck' do
      20.times { bowling.roll(0) }
      expect(bowling.total_score).to eq(0)
    end

    it 'returns 20 with 1 pin struck per roll' do
      20.times { bowling.roll(1) }
      expect(bowling.total_score).to eq(20)
    end
  end

  describe 'can return a total score with a spare' do
    it 'returns a score of 12' do
      bowling.roll(9)
      2.times { bowling.roll(1) }
      17.times { bowling.roll(0) }
      expect(bowling.total_score).to eq(12)
    end

    it 'returns a score 12' do
      bowling.roll(1)
      bowling.roll(9)
      bowling.roll(1)
      17.times { bowling.roll(0) }
      expect(bowling.total_score).to eq(12)
    end

    it 'returns a score of 12' do
      2.times { bowling.roll(0) }
      bowling.roll(1)
      bowling.roll(9)
      bowling.roll(1)
      15.times { bowling.roll(0) }
      expect(bowling.total_score).to eq(12)
    end

    it 'returns a score of 11 with spare at end' do
      18.times{ bowling.roll(0) }
      bowling.roll(9)
      2.times { bowling.roll(1) }
      expect(bowling.total_score).to eq(11)
    end
  end

  describe 'can return a total score with two spares' do
    it 'returns a score of 23' do
      2.times do
        bowling.roll(1)
        bowling.roll(9)
      end
      bowling.roll(1)
      15.times { bowling.roll(0) }
      expect(bowling.total_score).to eq(23)
    end
  end

  describe 'can return a total score with strike' do
    it 'returns a score of 14' do
      bowling.roll(10)
      2.times { bowling.roll(1) }
      17.times { bowling.roll(0) }
      expect(bowling.total_score).to eq(14)
    end

    it 'returns a score of 30' do
      bowling.roll(10)
      18.times { bowling.roll(1) }
      expect(bowling.total_score).to eq(30)
    end

    it 'returns a score of 12 with a strike at the end' do
      18.times { bowling.roll(0) }
      bowling.roll(10)
      2.times { bowling.roll(1) }
      expect(bowling.total_score).to eq(12)
    end
  end
end