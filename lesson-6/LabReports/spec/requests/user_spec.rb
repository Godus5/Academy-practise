require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET index" do
    subject { response }
    context "Request to view all users" do
      it "Render the index page" do
        get users_path
        expect(subject).to render_template(:index)
      end
    end
  end

  describe "GET show" do
    subject { response }

    context "Request for withdrawal of a specific user" do
      before do
        User.create(email: 'example@example.com', first_name: 'first name', last_name: 'last name')
      end

      it "Render the show page" do
        get user_path(id: 1)
        expect(subject).to render_template(:show)
      end
    end
  end

  describe "POST create" do
    subject { response }

    context "Request for withdrawal of a specific user" do
      before do
        User.create(email: 'example@example.com', first_name: 'first name', last_name: 'last name')
      end

      it "Render the show page" do
        get user_path(id: 1)
        expect(subject).to render_template(:show)
      end
    end
  end
end
