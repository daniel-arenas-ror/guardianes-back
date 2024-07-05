require 'rails_helper'

RSpec.describe Worker, type: :model do
  subject { described_class.new }

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:color) }
  end
end
