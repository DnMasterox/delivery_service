# frozen_string_literal: true

RSpec.describe PackageAssignment do
  it { expect(subject).to belong_to(:courier) }
  it { expect(subject).to belong_to(:package) }
end
