require 'rails_helper'

RSpec.describe User, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"

    it "User sign-up email" do
      res = User.create()

      expect(res).to eq(true)
    end
end
