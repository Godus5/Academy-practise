# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  let!(:account) { create(:account) }

  before do
    sign_in(account)
  end

  describe "Validations" do
    subject { User.new(first_name:, last_name:, account_id: account.id).valid? }

    context "Creating a new record with valid attributes" do
      let(:first_name) { "first_name" }
      let(:last_name) { "last_name" }

      binding.pry


      it "The check runs without errors" do
        expect(subject).to eq(true)
      end
    end

    context "Creating a new record with invalid attributes" do
      let(:first_name) { "" }
      let(:last_name) { "last_name" }

      it "The check runs without errors" do
        expect(subject).to eq(false)
      end
    end
  end
end
