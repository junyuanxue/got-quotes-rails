class ApiClient
  include HTTParty
  BASE_URI = 'https://got-quotes.herokuapp.com'

  def initialize
  end

  def get_quote()
    response = self.class.get(BASE_URI + '/quotes')
    parse_data(response.parsed_response)
  end

  private

  def parse_data(data)
    {
      'quote': {
        'content': data['quote'],
        'character': data['character']
      }
    }
  end
end
