module Concerns
  module NestedClientBuilder
    def build_client_data
      build_client unless client
      client.build_passport unless client.passport
      client.build_contact_information unless client.contact_information
      contact = client.contact_information
      contact.phones.build unless contact.phones.any?
      contact.emails.build unless contact.emails.any?
      client
    end
  end
end