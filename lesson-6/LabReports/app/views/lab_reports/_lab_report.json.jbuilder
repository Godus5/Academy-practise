# frozen_string_literal: true

json.extract! lab_report, :id, :title, :description, :grade, :user_id, :created_at, :updated_at
json.url lab_report_url(lab_report, format: :json)
