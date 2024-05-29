# frozen_string_literal: true

class LabReport < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 500 }
  validates :description, length: { maximum: 250 }
  validates :grade, inclusion: { in: %w[A B C D E FX F None],
                                 message: '%<value>s is not a valid grade' }
end
