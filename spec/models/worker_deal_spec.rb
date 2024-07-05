require 'rails_helper'

RSpec.describe WorkerDeal, type: :model do
  subject { described_class.new }

  describe "associations" do
    it { is_expected.to belong_to(:worker) }
    it { is_expected.to belong_to(:deal) }
  end
end
