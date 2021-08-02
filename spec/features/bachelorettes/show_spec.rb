require 'rails_helper'

RSpec.describe 'The bachelorette show page' do
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

    visit "/bachelorettes/#{@bachelorette.id}"
  end

#   User Story 1 of 6
#
# As a visitor,
# When I visit '/bachelorettes/:id',
# I see that bachelorette's:
# -Name
# -Season Number
# -Description of Season that they were on
# (e.g.
#                   Hannah Brown
#     Season 15 - The Most Dramatic Season Yet!
#   )
# I also see a link to see that bachelorette's contestants
# When I click on that link
# I'm taken to "/bachelorettes/:bachelorette_id/contestants"
# and I can see only that bachelorette's contestants

  it 'displays the bachelorettes name, season number, and season description' do
    expect(page).to have_content(@bachelorette.name)
    expect(page).to have_content(@bachelorette.season_number)
    expect(page).to have_content(@bachelorette.description)
  end

  it 'displays a link to the bachelorettes contestants' do
    expect(page).to have_link('Contestants')
  end

  it 'links over to a new page which only shows that bachelorettes contestants' do
    click_link('Contestants')
    expect(current_path).to eq(bachelorette_contestants_path(@bachelorette.id))
    expect(page).to have_content(@contestant1.name)
    expect(page).to have_content(@contestant2.name)
    expect(page).to have_content(@contestant3.name)
    expect(page).to have_content(@contestant4.name)
    expect(page).to have_content(@contestant5.name)
    expect(page).to have_content(@contestant6.name)
    expect(page).to have_content(@contestant7.name)
    expect(page).to have_content(@contestant8.name)
  end

  it 'displays the average age of the contestants' do
    expected = ((21+22+23+24+25+26+27+28)/8.0)
    expect(page).to have_content("Average Age of Contestants: #{expected}")
    save_and_open_page
  end
end
