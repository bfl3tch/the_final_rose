require 'rails_helper'

RSpec.describe Outing do
  describe 'relationships' do
    it { should have_many(:events) }
    it { should have_many(:contestants).through(:events) }
  end
end
