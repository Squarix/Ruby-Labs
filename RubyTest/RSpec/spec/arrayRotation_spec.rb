require 'rspec'
require_relative '../lib/arrayRotation.rb'

describe 'array_rotation' do
  let(:empty_array) { NewArray.new([]) }
  let(:array) { NewArray.new([1, 2, 3, 4, 5]).rotate_arr(-1) }
  let(:new_array) { NewArray.new([1, 2, 3, 4, 5]) }
  let(:err_message) { 'Error' }

  describe 'rotate array' do
    context 'amount of steps is non-positive' do
      it 'should give Error' do
        expect(array).to eq err_message
      end
    end
  end

  describe 'try to lookup empty array' do
    subject(:empty) { [] }
    context 'Array is empty' do
      it 'shows empty array' do
        expect(empty_array.lookup).to eq empty
      end
      it 'rotates empty_array' do
        expect(empty_array.rotate_arr(2)).to eq err_message
      end
    end
  end

  describe 'want to get array' do
    subject(:expected_array) { [1, 2, 3, 4, 5] }
    context 'usual array => no errors should be' do
      it 'should return Array' do
        expect(new_array.get_array).to eq expected_array
      end
    end
  end

  describe 'try to rotate array' do
    subject(:expected_array) { [3, 4, 5, 1, 2] }
    it 'returns rotated array' do
      expect(new_array.rotate_arr(3)).to eq expected_array
    end
  end
end
