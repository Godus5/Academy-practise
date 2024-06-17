# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    association :account
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    email { account.email }
  end
end
