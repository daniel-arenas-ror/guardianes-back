require 'rails_helper'

RSpec.describe ServiceDeal, type: :model do
  subject { described_class.new }

  describe "associations" do
    it { is_expected.to belong_to(:deal) }
    it { is_expected.to belong_to(:service) }
  end
end
