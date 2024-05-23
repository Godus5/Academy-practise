# frozen_string_literal: true

class User < ApplicationRecord
  has_many :lab_reports

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP },
                    length: { maximum: 150 }
  validates :first_name, presence: true, length: { maximum: 100 }
  validates :last_name, presence: true, length: { maximum: 100 }
end
