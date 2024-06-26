# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Users", type: :request do
  let!(:account) { create(:account) }

  before do
    sign_in account
  end

  describe "GET index" do
    subject { get users_path }
    context "Request to view all users" do
      it "Render the index page" do
        expect(subject).to render_template(:index)
      end
    end
  end

  describe "GET show" do
    subject { get user_path(user.id) }
    let!(:user) { create(:user, account: account) }

    context "Request for withdrawal of a specific user" do
      it "Render the show page" do
        expect(subject).to render_template(:show)
      end
    end
  end

  describe "GET new" do
    subject { get new_user_path }

    context "Request page to create a new user" do
      it "Render the new page" do
        expect(subject).to render_template(:new)
      end
    end
  end

  describe "POST create" do
    context "Creating a record with valid values" do
      let(:valid_params) do
        {user: {email: "example@example.com", first_name: "first name", last_name: "last name"}}
      end
      subject { post users_path, params: valid_params }

      it "The number of entries will increase by 1 and redirect to the lab report index page", :aggregate_failures do
        expect { subject }.to change(User, :count).by(1)
        expect(subject).to redirect_to(lab_reports_path)
      end
    end

    context "Creating a record with invalid values" do
      let(:invalid_params) { {user: {first_name: "", last_name: "last name"}} }
      subject { post users_path, params: invalid_params }

      it "The number of records will not increase and redirects to a page with a form for a new user", :aggregate_failures do
        expect { subject }.to_not change(User, :count)
        expect(subject).to render_template(:new)
      end
    end
  end

  describe "PATCH update" do
    let!(:user) { create(:user, account: account) }

    context "Updating a record with valid data entered" do
      let(:valid_params) do
        {user: {first_name: "Anton"}}
      end
      subject { patch user_path(user), params: valid_params }

      it "Redirects to the updated user page" do
        expect(subject).to redirect_to(user_url(user.id))
      end
    end

    context "Updating a record with invalid data entered" do
      let(:invalid_params) do
        {user: {first_name: ""}}
      end
      subject { patch user_path(user), params: invalid_params }

      it "Render edit page to correct entered data" do
        expect(subject).to render_template(:edit)
      end
    end
  end

  describe "DELETE destroy" do
    subject { delete user_path(user) }
    let!(:user) { create(:user, account: account) }

    context "A destroy request is made for the user being viewed" do
      it "The number of records decreases and the page index is rendered", :aggregate_failures do
        expect { subject }.to change(User, :count).by(-1)
        expect(subject).to redirect_to(users_path)
      end
    end
  end
end
