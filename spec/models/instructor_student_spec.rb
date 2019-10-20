require 'rails_helper'

RSpec.describe InstructorStudent do
  describe 'relationships' do
    it { should belong_to :instructor }
    it { should belong_to :student }
  end
end
