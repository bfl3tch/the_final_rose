require 'rails_helper'

RSpec.describe Bachelorette, type: :model do
  describe 'relationships' do
    it {should have_many :contestants}
  end

  describe 'instance methods' do
    before(:each) do
      @bachelorette = Bachelorette.create!(name: 'Original', season_number: 1, description: 'The first one!')

      @contestant1 = @bachelorette.contestants.create!(name: 'a b', age: 21, hometown: 'hollywood')
      @contestant2 = @bachelorette.contestants.create!(name: 'c d', age: 22, hometown: 'memphis')
      @contestant3 = @bachelorette.contestants.create!(name: 'e f', age: 23, hometown: 'portland')
      @contestant4 = @bachelorette.contestants.create!(name: 'g h', age: 24, hometown: 'hollywood')
      @contestant5 = @bachelorette.contestants.create!(name: 'i j', age: 25, hometown: 'boise')
      @contestant6 = @bachelorette.contestants.create!(name: 'k l', age: 26, hometown: 'atlanta')
      @contestant7 = @bachelorette.contestants.create!(name: 'm n', age: 27, hometown: 'jacksonville')
      @contestant8 = @bachelorette.contestants.create!(name: 'o p', age: 28, hometown: 'miami')

      @outing1 = Outing.create!(name: 'party1', location: 'jungle', date: '04/12/2009')
      @outing2 = Outing.create!(name: 'party2', location: 'mountain', date: '05/12/2009')
      @outing3 = Outing.create!(name: 'party3', location: 'beach', date: '06/12/2009')
      @outing4 = Outing.create!(name: 'party4', location: 'river', date: '07/12/2009')

      @event1 = Event.create(outing: @outing1, contestant: @contestant1)
      @event2 = Event.create(outing: @outing2, contestant: @contestant1)
      @event3 = Event.create(outing: @outing3, contestant: @contestant1)

      @event5 = Event.create(outing: @outing1, contestant: @contestant2)
      @event6 = Event.create(outing: @outing2, contestant: @contestant2)
      @event7 = Event.create(outing: @outing3, contestant: @contestant2)
      @event8 = Event.create(outing: @outing4, contestant: @contestant2)

      @event9 = Event.create(outing: @outing1, contestant: @contestant3)
      @event10 = Event.create(outing: @outing2, contestant: @contestant3)
      @event11 = Event.create(outing: @outing3, contestant: @contestant4)
      @event12 = Event.create(outing: @outing4, contestant: @contestant4)
    end

    describe '#average_age' do
      it 'calculates the average age of the contestants of a particular bachelorette' do
        expected = ((21+22+23+24+25+26+27+28)/8.0)

        expect(@bachelorette.average_age).to eq(expected)
      end
    end

    describe '#hometown_list' do
      it 'displays a list of all the hometowns uniquely' do
        list = [@contestant1.hometown, @contestant2.hometown,
          @contestant3.hometown,@contestant4.hometown,@contestant5.hometown,
          @contestant6.hometown,@contestant7.hometown,@contestant8.hometown]
        expected = list.uniq

        expect(@bachelorette.hometown_list).to eq(expected)

      end
    end
  end
end
