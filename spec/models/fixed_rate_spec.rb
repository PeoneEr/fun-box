require 'rails_helper'

RSpec.describe FixedRate, type: :model do
  describe 'validations' do
    it { should validate_presence_of :value }
    it { should validate_presence_of :unfix_at }
    it { should validate_numericality_of(:value).is_greater_than(0).is_less_than(1000) }
    it { should allow_values(5, 0.3, 8.4598).for(:value) }
    it { should_not allow_value(9.83604).for(:value) }
    it { should allow_value(Time.zone.now + 1.day).for(:unfix_at) }
  end
end
