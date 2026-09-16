require "rails_helper"

RSpec.describe PostImage, type: :model do
  describe "バリデーション" do
    it "ショップ名が空の場合は保存できない" do
      post_image = PostImage.new(shop_name: nil)

      post_image.valid?

      expect(post_image.errors[:shop_name]).to be_present
    end

    it "画像が空の場合は保存できない" do
      post_image = PostImage.new(image: nil)

      post_image.valid?

      expect(post_image.errors[:image]).to be_present
    end
  end
end