require 'rspec'
require_relative '../lib/array_rotation.rb'

describe NewArray do
  let(:empty_array) { described_class.new([]) }
  let(:array) { described_class.new([1, 2, 3, 4, 5]).rotate_arr(-1) }
  let(:new_array) { described_class.new([1, 2, 3, 4, 5]) }
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
    subject(:expected_array) { [1, 2, 3, 4, 5] }
    context 'usual array => no errors should be' do
      it 'should return Array' do
        expect(new_array.get_array).to eq expected_array
      end
    end
  end

  describe 'rotate_arr' do
    subject(:expected_array) { [3, 4, 5, 1, 2] }
    it 'returns rotated array' do
      expect(new_array.rotate_arr(3)).to eq expected_array
    end
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