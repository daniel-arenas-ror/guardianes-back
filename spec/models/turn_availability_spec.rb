require 'rails_helper'

RSpec.describe TurnAvailability, type: :model do

  describe "validations" do
    subject { FactoryBot.build(:turn_availability, turn: turn, worker: worker) }
    let(:turn) { create(:turn) }
    let(:worker) { create(:worker) }

    it { is_expected.to belong_to(:turn) }
    it { is_expected.to belong_to(:worker) }

    it { is_expected.to validate_uniqueness_of(:turn_id).scoped_to(:worker_id) }
  end
end
