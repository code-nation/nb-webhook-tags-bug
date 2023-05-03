module NbPeople::Show
  def self.call(nb_signup_id)
    begin
      nb_client = NbClient.call
      result = nb_client.call(:people, :show, id: nb_signup_id)
      result['person'].with_indifferent_access
    rescue NationBuilder::ClientError => e
      puts e.message
    end
  end
end