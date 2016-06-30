class ApiClient
  include HTTParty
  BASE_URI = 'https://got-quotes.herokuapp.com'

  def initialize
  end

  def get_quote()
    response = self.class.get(BASE_URI + '/quotes')
    response.parsed_response
  end
end
