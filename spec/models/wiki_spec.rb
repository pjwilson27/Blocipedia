require 'rails_helper'
require 'devise'

RSpec.describe Wiki, type: :model do
  let(:wiki) {Wiki.create!(title: "New Wiki Title", body: "Wiki Body", private: false) }
  
  describe "attributes" do
      it "has a title, body, and private attributes" do
          expect(wiki).to have_attributes(title: "New Wiki Title", body: "Wiki Body", private: false)
      end
  end
end
