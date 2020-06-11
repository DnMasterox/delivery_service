# frozen_string_literal: true

RSpec.describe PackageAssignment do
  let(:valid_package_assignment) do
    FactoryBot.build(:package_assignment, :processing_delivery_status)
  end
  let(:invalid_package_assignment) do
    FactoryBot.build(:package_assignment)
  end

  describe 'validations' do
    it 'should pass with valid package status' do
      expect(valid_package_assignment).to receive(:check_package_status).and_call_original
      expect(valid_package_assignment).to be_valid
    end
    it 'should not pass with invalid package status' do
      expect(invalid_package_assignment).to receive(:check_package_status)
        .and_call_original
      expect(invalid_package_assignment).not_to be_valid
      expect(invalid_package_assignment.errors).to have_key(:package)
    end
  end

  describe 'callbacks' do
    it 'should change package status after creation' do
      expect { valid_package_assignment.save }.to change(valid_package_assignment.package,
                                                         :delivery_status)
        .from('processing').to('assigned')
    end
  end
end
