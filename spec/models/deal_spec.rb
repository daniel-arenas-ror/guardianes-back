require 'rails_helper'

RSpec.describe Deal, type: :model do
  subject { described_class.new }

  describe "validations" do
    it { is_expected.to validate_presence_of(:serial) }
  end

  describe "associations" do
    it { is_expected.to have_many(:service_deals) }
    it { is_expected.to have_many(:services) }
    it { is_expected.to have_many(:worker_deals) }
    it { is_expected.to have_many(:workers) }
    it { is_expected.to have_many(:schedule_weeks) }
  end
end
