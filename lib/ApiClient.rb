class ApiClient
  include HTTParty
  BASE_URI = 'https://got-quotes.herokuapp.com'

  def initialize
  end

  def getQuote()
    self.class.get(BASE_URI + '/quotes')
  end
end
