require 'rails_helper'

RSpec.describe Comment, type: :model do

  it "contentが空ならバリデーションが通らない" do
     comment = Comment.new(user_id:1, shift_id:1,content: "")
     expect(comment).not_to be_valid
  end
end
