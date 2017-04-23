require 'rails_helper'

RSpec.describe Project, type: :model do
  it { should have_one(:project_team) }
  it { should have_many(:matches) }
  it { should have_many(:member_project_associations) }

  before(:each) { @project = create(:project) }

  it 'creates one' do
    expect(@project).to have_attributes(name: "Mærsk Logistics")
  end
end
