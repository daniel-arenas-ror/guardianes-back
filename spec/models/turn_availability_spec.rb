require 'rails_helper'

RSpec.describe TurnAvailability, type: :model do
  subject { described_class.new }

  describe "validations" do
    it { is_expected.to belong_to(:turn) }
    it { is_expected.to belong_to(:worker) }
  end
end
