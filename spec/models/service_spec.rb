require 'rails_helper'

RSpec.describe Service, type: :model do
  subject { described_class.new }

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end
end
