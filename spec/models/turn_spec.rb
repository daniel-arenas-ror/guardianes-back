require 'rails_helper'

RSpec.describe Turn, type: :model do
  subject { described_class.new }

  describe "associations" do
    it { is_expected.to belong_to(:service_deal) }
  end

  describe "validations" do
    subject { FactoryBot.build(:turn) }

    it { is_expected.to validate_presence_of(:key) }
    it { is_expected.to validate_presence_of(:week) }
    it { is_expected.to validate_uniqueness_of(:key).case_insensitive }
  end
end
