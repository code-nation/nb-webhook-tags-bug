class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def person_changed
    ###
    ## This is the data provided by the NB person_changed webhook
    ###
    webhook_data = params[:payload][:person]
    nb_signup_id = webhook_data[:id]
    webhook_tags = webhook_data[:tags]

    ###
    ## This is the NB profile's actual data at the current point in time
    ###
    endpoint_data = NbPeople::Show.call(nb_signup_id)
    endpoint_tags = endpoint_data.nil? ? [] : endpoint_data[:tags]
    missing_tags = (endpoint_tags - webhook_tags)

    PersonWebhook.create!(
      nb_signup_id: nb_signup_id,
      tags: webhook_tags,
      actual_latest_tags: endpoint_tags,
      missing_tags: missing_tags,
      has_missing_tags: (missing_tags.size > 0)
    )

    head :ok
  end
end