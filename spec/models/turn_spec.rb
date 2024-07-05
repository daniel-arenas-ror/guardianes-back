require 'rails_helper'

RSpec.describe Turn, type: :model do
  subject { described_class.new }

  describe "associations" do
    it { is_expected.to belong_to(:worker) }
    it { is_expected.to belong_to(:service_deal) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:key) }
    it { is_expected.to validate_presence_of(:week) }
  end
end
