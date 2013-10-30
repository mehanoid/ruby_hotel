module Concerns
  module ClientAttributes
    private

    def client_attributes
      [:first_name,
       :last_name,
       :middle_name,
       {
           contact_information_attributes: [
               {
                   emails_attributes: [:address],
                   phones_attributes: [:number]
               }
           ]
       }
      ]
    end
  end
end
