require 'json'

class ApiClient
  include HTTParty
  BASE_URI = 'https://got-quotes.herokuapp.com'

  def initialize
  end

  def getQuote()
    response = self.class.get(BASE_URI + '/quotes')
    parse_data(response.parsed_response)
  end

  private

  def parse_data(data)
    json_data = JSON.parse(data)
    {
      'quote': {
        'content': json_data['quote'],
        'character': json_data['character']
      }
    }
  end
end
