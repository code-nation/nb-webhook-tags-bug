class PersonWebhook < ApplicationRecord
  scope :has_missing_tags, -> { where(has_missing_tags: true) }

  def created_at_formatted
    created_at.strftime("%-I:%M%P on %-d %b %Y")
  end
end
