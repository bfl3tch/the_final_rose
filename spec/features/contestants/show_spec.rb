require 'rails_helper'

RSpec.describe 'The bachelorette contestants index page' do
  before(:each) do
    @bachelorette = Bachelorette.create!(name: 'Original', season_number: 1, description: 'The first one!')

    @contestant1 = @bachelorette.contestants.create!(name: 'a b', age: 21, hometown: 'hollywood')
    @contestant2 = @bachelorette.contestants.create!(name: 'c d', age: 22, hometown: 'memphis')
    @contestant3 = @bachelorette.contestants.create!(name: 'e f', age: 23, hometown: 'portland')
    @contestant4 = @bachelorette.contestants.create!(name: 'g h', age: 24, hometown: 'seattle')
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

    visit "/bachelorettes/#{@bachelorette.id}/contestants/#{@contestant1.id}"
  end

  it 'displays the contestant name, season number and description of the bachelorette' do
    expect(page).to have_content(@bachelorette.season_number)
    expect(page).to have_content(@bachelorette.description)
  end

  it 'displays all contestant outings as links to outing show page' do
    expect(page).to have_link(@outing1.name)
    expect(page).to have_link(@outing2.name)
    expect(page).to have_link(@outing3.name)
    expect(page).to_not have_link(@outing4.name)
  end

  it 'actually redirects you upon clicking that link' do
    click_link("#{@outing1.name}")

    expect(current_path).to eq(outing_path(@outing1))
  end
end
