# frozen_string_literal: true

require "rails_helper"

RSpec.describe "LabReports", type: :request do
  let!(:account) { create(:account) }

  before do
    sign_in(account)
  end

  describe "GET index" do
    let!(:user) { create(:user, account: account) }
    subject { get lab_reports_path }
    context "Request a view of all lab reports" do
      it "Render the index page" do
        expect(subject).to render_template(:index)
      end
    end
  end

  describe "GET show" do
    subject { get lab_report_path(lab_report.id) }
    let!(:user) { create(:user, account: account) }
    let!(:lab_report) { create(:lab_report, user: user) }

    context "Request for retraction of a specific laboratory report" do
      it "Render the show page" do
        expect(subject).to render_template(:show)
      end
    end
  end

  describe "GET new" do
    subject { get new_lab_report_path }

    context "Request page for creating a new lab report" do
      it "Render the new page" do
        expect(subject).to render_template(:new)
      end
    end
  end

  describe "POST create" do
    let!(:user) { create(:user, account: account) }

    context "Creating a record with valid values" do
      let(:valid_params) do
        {lab_report: {title: "Rails application", description: "Laboratory reports", grade: "None"}}
      end
      subject { post lab_reports_path, params: valid_params }

      it "The number of records will increase by 1 and redirect to the generated laboratory report page", :aggregate_failures do
        expect { subject }.to change(LabReport, :count).by(1)
        expect(subject).to redirect_to(lab_report_url(id: 1))
      end
    end

    context "Creating a record with invalid values" do
      let(:invalid_params) do
        {lab_report: {title: "Rails application", description: "Laboratory reports", grade: "123"}}
      end
      subject { post lab_reports_path, params: invalid_params }

      it "The number of records will not increase and will redirect to a page with a new laboratory report form", :aggregate_failures do
        expect { subject }.not_to change(LabReport, :count)
        expect(subject).to render_template(:new)
      end
    end
  end

  describe "PATCH update" do
    let!(:user) { create(:user, account: account) }
    let!(:lab_report) { create(:lab_report, user: user) }

    context "Update a record with valid data entered" do
      let(:valid_params) do
        {lab_report: {email: "elpmaxe@example.com"}}
      end
      subject { patch lab_report_path(lab_report), params: valid_params }

      it "Redirects to updated lab report page" do
        expect(subject).to redirect_to(lab_report_url(lab_report.id))
      end
    end

    context "Updating a record with invalid data entered" do
      let(:invalid_params) do
        {lab_report: {grade: "123"}}
      end
      subject { patch lab_report_path(lab_report), params: invalid_params }

      it "Render edit page to correct entered data" do
        expect(subject).to render_template(:edit)
      end
    end
  end

  describe "DELETE destroy" do
    subject { delete lab_report_path(lab_report) }
    let!(:user) { create(:user, account: account) }
    let!(:lab_report) { create(:lab_report, user: user) }
    context "A destroy request has been made for the lab report viewing." do
      it "The number of records decreases and the page index is rendered", :aggregate_failures do
        expect { subject }.to change(LabReport, :count).by(-1)
        expect(subject).to redirect_to(lab_reports_path)
      end
    end
  end
end
