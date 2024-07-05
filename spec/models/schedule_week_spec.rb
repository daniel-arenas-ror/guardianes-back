require 'rails_helper'

RSpec.describe ScheduleWeek, type: :model do
  subject { described_class.new }

  describe "validations" do
    it { is_expected.to validate_presence_of(:day) }
    it { is_expected.to validate_presence_of(:from) }
    it { is_expected.to validate_presence_of(:to) }
    it { is_expected.to validate_inclusion_of(:day).in_range(0..6) }
    it { is_expected.to validate_inclusion_of(:from).in_range(0..23) }
    it { is_expected.to validate_inclusion_of(:to).in_range(0..23) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:deal) }
  end
end
