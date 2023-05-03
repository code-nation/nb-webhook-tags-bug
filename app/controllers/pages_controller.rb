class PagesController < ApplicationController
  def home
    @webhooks = PersonWebhook.has_missing_tags.limit(200).order(created_at: :desc)
    # Explicitly load records to avoid multiple database calls in the views
    # when using .any? to check if records exist before iterating over them
    @webhooks.load
  end
end
