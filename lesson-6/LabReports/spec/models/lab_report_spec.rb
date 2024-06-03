# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    let!(:user) { create(:user) }
    subject { LabReport.new(title:, description:, grade:).valid? }

    context 'Creating a new record with valid attributes' do
      let(:title) { 'Rails application' }
      let(:description) { 'Laboratory reports' }
      let(:grade) { 'None' }

      it 'The check runs without errors' do
        expect(subject).to eq(true)
      end
    end

    context 'Creating a new record with invalid attributes' do
      let(:title) { 'Rails application' }
      let(:description) { 'Laboratory reports' }
      let(:grade) { '123' }

      it 'The check runs without errors' do
        expect(subject).to eq(false)
      end
    end
  end
end
