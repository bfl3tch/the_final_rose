require 'rails_helper'

RSpec.describe 'The bachelorette contestants how page' do
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

    visit "/bachelorettes/#{@bachelorette.id}/contestants"
  end

  it 'displays the names of all of the contestants' do
    expect(page).to have_content(@contestant1.name)
    expect(page).to have_content(@contestant2.name)
    expect(page).to have_content(@contestant3.name)
    expect(page).to have_content(@contestant4.name)
    expect(page).to have_content(@contestant5.name)
    expect(page).to have_content(@contestant6.name)
    expect(page).to have_content(@contestant7.name)
    expect(page).to have_content(@contestant8.name)
  end
#
#   -Age
# -Hometown
# (e.g. "Name: Pilot Pete, Age: 34, Hometown: Irving, TX")
# And I can click on any contestants name (as a link) to go to that contestants show page "/contestants/:id"
  it 'displays the attributes of those contestants' do
    expect(page).to have_content(@contestant1.age)
    expect(page).to have_content(@contestant2.age)
    expect(page).to have_content(@contestant3.age)
    expect(page).to have_content(@contestant4.age)
    expect(page).to have_content(@contestant5.hometown)
    expect(page).to have_content(@contestant6.hometown)
    expect(page).to have_content(@contestant7.hometown)
    expect(page).to have_content(@contestant8.hometown)
  end
  it 'has each name as a link to that contestants show page' do
      expect(page).to have_link("#{@contestant1.name}")
  end

  it 'redirects you to the contestants show page after clicking that link' do
    click_link("#{@contestant1.name}")

    expect(current_path).to eq(contestant_path(@contestant1))
  end
end
