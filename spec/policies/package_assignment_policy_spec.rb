# frozen_string_literal: true

RSpec.describe PackageAssignmentPolicy do
  let(:package_assignment) { build(:package_assignment) }
  subject { PackageAssignmentPolicy.new(user, package_assignment) }
  context 'being a visitor' do
    let(:user) { nil }
    it {
      is_expected.to_not permit_actions(%i[index create show new update
                                           edit destroy])
    }
  end

  context 'being an administrator' do
    let(:user) { build(:delivery_manager) }
    it {
      is_expected.to permit_actions(%i[index create show new update
                                       edit destroy])
    }
  end
end
