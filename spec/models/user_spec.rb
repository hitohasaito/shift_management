require 'rails_helper'

RSpec.describe User, type: :model do

  it "nameが空ならバリデーションが通らない" do
     user = User.new(name: '', email: 'aa@gmail.com',number: "08077776666", password:"aaaaaaa")
     expect(user).not_to be_valid
  end

   it "numberが空ならバリデーションが通らない" do
     user = User.new(name: 'aaa', email: 'aa@gmail.com',number: "", password:"aaaaaaa")
     expect(user).not_to be_valid
   end

   it "nameが数値以外だとバリデーションが通らない" do
      user = User.new(name: 'aaa', email: 'aa@gmail.com',number: "aa08%88", password:"aaaaaaa")
      expect(user).not_to be_valid
   end
end
