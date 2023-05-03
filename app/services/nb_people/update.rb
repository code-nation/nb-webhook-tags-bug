module NbPeople::Update
  def self.call(nb_signup_id, attributes)
    begin
      nb_client = NbClient.call
      result = nb_client.call(:people, :update, {
        id: nb_signup_id,
        person: attributes
      })
      result['person']
    rescue NationBuilder::ClientError => e
      JSON.parse(e.message)
    end
  end
end