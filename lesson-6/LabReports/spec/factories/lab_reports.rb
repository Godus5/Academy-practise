# frozen_string_literal: true

FactoryBot.define do
  factory :lab_report do
    association :user
    title { FFaker::Book.title }
    description { FFaker::Book.description[1..250] }
    grade { "None" }
  end
end
