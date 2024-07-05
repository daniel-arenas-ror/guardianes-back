require 'rails_helper'

RSpec.describe Deal, type: :model do
  subject { described_class.new }

  describe "validations" do
    it { is_expected.to validate_presence_of(:serial) }
  end
end
