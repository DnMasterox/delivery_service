# frozen_string_literal: true

RSpec.describe PackagePolicy, type: :policy do
  let(:package) { build(:package) }
  subject { CourierPolicy.new(user, package) }
  context 'being a visitor' do
    let(:user) { build(:delivery_manager, enabled: false) }
    it {
      is_expected.to_not permit_actions(%i[index create show new update
                                           edit destroy])
    }
    let(:user) { build(:courier) }
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
