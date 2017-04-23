require 'rails_helper'

RSpec.describe TeamMember, type: :model do
  it { should have_one(:member_skill) }
  it { should have_many(:matches) }

  before(:each) { @member = create(:team_member) }
#
  it 'creates one' do
    expect(@member).to have_attributes(name: "JC Chasez")
  end
end
