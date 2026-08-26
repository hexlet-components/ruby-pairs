# frozen_string_literal: true

require 'pairs'

RSpec.describe Pairs do
  it 'cons, car, cdr' do
    pair = described_class.cons(3, 4)
    expect(described_class.car(pair)).to be(3)
    expect(described_class.cdr(pair)).to be(4)
  end

  it 'to_string #1' do
    pair = described_class.cons(10, -10)
    expect(described_class.to_string(pair)).to eq('(10, -10)')
  end

  it 'to_string #2' do
    pair = described_class.cons(described_class.cons(3, 5), described_class.cons(1, true))
    expect(described_class.to_string(pair)).to eq('((3, 5), (1, true))')
  end

  it 'to_string #3' do
    pair = described_class.cons(10, described_class.cons(0, 1))
    expect(described_class.to_string(pair)).to eq('(10, (0, 1))')
  end

  it 'pair?' do
    pair = described_class.cons(10, 10)
    expect(described_class).to be_pair(pair)
    expect(described_class).not_to be_pair('asdf')
    expect(described_class).not_to be_pair({ key: 'value' })
  end

  it 'check_pair' do
    expect { described_class.car(345) }.to raise_error(NoMethodError)
    expect { described_class.cdr('asdf') }.to raise_error(NoMethodError)
    expect { described_class.car({ key: 'value' }) }.to raise_error(NoMethodError)
  end
end
