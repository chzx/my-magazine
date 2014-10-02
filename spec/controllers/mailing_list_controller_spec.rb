require 'rails_helper'

RSpec.describe MailingListController, :type => :controller do

  describe "GET sign_up" do
    it "returns http success" do
      get :sign_up
      expect(response).to be_success
    end
  end

end
