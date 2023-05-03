module NbClient
  def self.call
    nation_slug = Rails.application.credentials.nation_slug
    nation_token = Rails.application.credentials.nation_token
    @nb_client ||= NationBuilder::Client.new(nation_slug, nation_token, retries: 8)
  end
end