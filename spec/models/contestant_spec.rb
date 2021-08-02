require 'rails_helper'

RSpec.describe Contestant, type: :model do
  describe 'relationships' do
    it { should belong_to :bachelorette}
    it { should have_many(:events)}
    it { should have_many(:outings).through(:events)}
  end
end
