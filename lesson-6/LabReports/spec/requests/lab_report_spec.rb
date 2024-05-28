# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'LabReports', type: :request do
  describe 'GET index' do
    subject { response }
    context 'Request a view of all lab reports' do
      it 'Render the index page' do
        get lab_reports_path
        expect(subject).to render_template(:index)
      end
    end
  end

  describe 'GET show' do
    subject { response }
    let!(:user) { User.create(email: 'example@example.com', first_name: 'first name', last_name: 'last name') }
    let!(:lab_report) { LabReport.create(title: 'Rails application', description: 'Laboratory reports', grade: 'None') }

    context 'Request for retraction of a specific laboratory report' do
      it 'Render the show page' do
        get lab_report_path(lab_report.id)
        expect(subject).to render_template(:show)
      end
    end
  end

  describe 'GET new' do
    subject { response }

    context 'Request page for creating a new lab report' do
      it 'Render the new page' do
        get new_lab_report_path
        expect(subject).to render_template(:new)
      end
    end
  end

  describe 'POST create' do
    subject { response }
    let!(:user) { User.create(email: 'example@example.com', first_name: 'first name', last_name: 'last name') }

    context 'Creating a record with valid values' do
      let(:valid_params) do
        { lab_report: { title: 'Rails application', description: 'Laboratory reports', grade: 'None' } }
      end

      it 'The number of records will increase by 1 and redirect to the generated laboratory report page' do
        expect do
          post lab_reports_path, params: valid_params
        end.to change(LabReport, :count).by(1)
        expect(subject).to redirect_to(lab_report_url(id: 1))
      end
    end

    context 'Creating a record with invalid values' do
      let(:invalid_params) do
        { lab_report: { title: 'Rails application', description: 'Laboratory reports', grade: '123' } }
      end

      it 'The number of records will not increase and will redirect to a page with a new laboratory report form' do
        expect do
          post lab_reports_path, params: invalid_params
        end.to_not change(LabReport, :count)
        expect(subject).to render_template(:new)
      end
    end
  end

  describe 'PATCH update' do
    subject { response }
    let!(:user) { User.create(email: 'example@example.com', first_name: 'first name', last_name: 'last name') }
    let(:lab_report) { LabReport.create(title: 'Rails application', description: 'Laboratory reports', grade: 'None') }

    context 'Update a record with valid data entered' do
      let(:valid_params) do
        { lab_report: { email: 'elpmaxe@example.com' } }
      end

      it 'Redirects to updated lab report page' do
        patch lab_report_path(lab_report), params: valid_params
        expect(subject).to redirect_to(lab_report_url(lab_report.id))
      end
    end

    context 'Updating a record with invalid data entered' do
      let(:invalid_params) do
        { lab_report: { grade: '123' } }
      end

      it 'Render edit page to correct entered data' do
        patch lab_report_path(lab_report), params: invalid_params
        expect(subject).to render_template(:edit)
      end
    end
  end

  describe 'DELETE destroy' do
    subject { response }
    let!(:user) { User.create(email: 'example@example.com', first_name: 'first name', last_name: 'last name') }
    let!(:lab_report) { LabReport.create(title: 'Rails application', description: 'Laboratory reports', grade: 'None') }
    context 'A destroy request has been made for the lab report viewing.' do
      it 'The number of records decreases and the page index is rendered' do
        expect do
          delete lab_report_path(lab_report)
        end.to change(LabReport, :count).by(-1)
        expect(subject).to redirect_to(lab_reports_path)
      end
    end
  end
end
