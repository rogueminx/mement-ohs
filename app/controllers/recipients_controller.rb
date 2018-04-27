class RecipientsController < ApplicationController
  def new
    @recipient = Recipient.new
  end

  def create
    @recipient = Recipient.new
  end
end
