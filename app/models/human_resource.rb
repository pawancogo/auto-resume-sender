# frozen_string_literal: true

class HumanResource < ApplicationRecord
  belongs_to :company, optional: true
  has_many :resume_human_resources, dependent: :destroy
  has_many :resumes, through: :resume_human_resources

  scope :active, -> { where(disabled_at: nil) }

  validates :name, presence: true
  validates :email, presence: true
  validate :email_phone_presence

  before_create :set_name, if: -> { name.blank? }

  private

  def set_name
    self.name = email.split('@').first.split('.').first.gsub(/[^a-zA-Z]/, '')
  end

  def email_phone_presence
    return unless email.blank? || phone_number.blank?

    errors.add(:base, 'Either email or phone number must be present')
  end
end
