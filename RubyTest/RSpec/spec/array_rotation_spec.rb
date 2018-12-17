require 'rspec'
require_relative '../lib/array_rotation.rb'

describe NewArray do
  let(:empty_array) { described_class.new([]) }
  let(:mock) { (1..5).to_a }
  let(:array) { described_class.new(mock).rotate_arr(-1) }
  let(:new_array) { described_class.new(mock) }
  let(:err_message) { 'Error' }

  describe 'lookup' do
    subject(:empty) { [] }
    context 'Array is empty' do
      it 'shows empty array' do
        expect(empty_array.lookup).to eq err_message
      end
    end
    context 'usual array' do
      it 'shows array' do
        expect(new_array.lookup).to eq true
      end
    end
  end

  describe 'get_array' do
    context 'usual array => no errors should be' do
      it 'should return Array' do
        expect(new_array.get_array).to eq mock
      end
    end
  end

  describe 'rotate_arr' do
    subject(:expected_array) { [3, 4, 5, 1, 2] }
    it 'returns rotated array' do

      expect(new_array.rotate_arr(3)).to eq expected_array
    end

    it { is_expected.to eq 1 }
    
    context 'array is empty' do
      it 'rotates empty_array' do
        expect(empty_array.rotate_arr(2)).to eq err_message
      end
    end
    context 'amount of steps is non-positive' do
      it 'should give Error' do
        expect(array).to eq err_message
      end
    end
  end
end