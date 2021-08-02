require 'rails_helper'

RSpec.describe Contestant, type: :model do
  describe 'relationships' do
    it { should belong_to :bachelorette}
    it { should have_many(:events)}
    it { should have_many(:outings).through(:events)}
  end

  describe 'class methods' do
    before(:each) do
      @bachelorette2 = Bachelorette.create!(name: 'Not', season_number: 2, description: 'The next one!')
      @contestant9 = @bachelorette2.contestants.create!(name: 'q r', age: 29, hometown: 'islip')

      @bachelorette = Bachelorette.create!(name: 'Original', season_number: 1, description: 'The first one!')
      @contestant1 = @bachelorette.contestants.create!(name: 'a b', age: 21, hometown: 'hollywood')
      @contestant2 = @bachelorette.contestants.create!(name: 'c d', age: 22, hometown: 'memphis')
      @contestant3 = @bachelorette.contestants.create!(name: 'e f', age: 23, hometown: 'portland')
      @contestant4 = @bachelorette.contestants.create!(name: 'g h', age: 24, hometown: 'seattle')
      @contestant5 = @bachelorette.contestants.create!(name: 'i j', age: 25, hometown: 'boise')
      @contestant6 = @bachelorette.contestants.create!(name: 'k l', age: 26, hometown: 'atlanta')
      @contestant7 = @bachelorette.contestants.create!(name: 'm n', age: 27, hometown: 'jacksonville')
      @contestant8 = @bachelorette.contestants.create!(name: 'o p', age: 28, hometown: 'miami')
    end
  end
end
