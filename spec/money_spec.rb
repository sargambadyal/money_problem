require 'spec_helper'

describe 'Money' do

  context "Equality and type check" do

    it 'equates to value of money object' do
      first_value=Money.new(1,1)
      second_value=Money.new(1,1)
      expect(first_value).to eq(second_value)
    end

    it 'same money should be equal' do
      first_value=Money.new(1,1)
      expect(first_value).to eq(first_value)
    end

    it '2 money added should have same type' do
      first_value = Money.new(1,1)
      second_value = Object.new
      expect(first_value).to_not eql(second_value)
    end

    it 'same moneys have same hash' do
      first_value = Money.new(1,1)
      second_value = Money.new(1,1)
      expect(first_value.hash).to eq(second_value.hash)
    end

    it 'money should not be zero/nil' do
      first_value = Money.new(0,0)
      expect(first_value).to_not eq(nil)
    end

  end

  context 'Add money' do

    it 'sums up Re 1 paise 75 and  rs 0 paisa 0 to rs 1 paisa 75' do
      expect(Money.new(1, 75) + Money.new(0, 0)).to eq(Money.new(1, 75))
    end

    it 'sums up Re 1 paise 75 and  rs 2 paisa 45 to rs 4 paisa 20' do
      expect(Money.new(1, 75) + Money.new(2, 45)).to eq(Money.new(4, 20))
    end

  end

  context "Subtract Money" do


    it 'subtracts Re 5 paise 20 and rs 1 paisa 12 to get rs 4 paisa 8' do
      expect(Money.new(5, 20) - Money.new(1, 12)).to eq(Money.new(4, 8))
    end


    it 'subtracts Re 1 paise 75 and rs 2 paisa 45 to get rs 4 paisa 20' do
      expect(Money.new(1, 75) - Money.new(2, 45)).to eq(Money.new(-1, 30))
    end
  end

end