class QuotesController < ApplicationController
  def index
    render json: Quote.all.shuffle[0]
  end
end
