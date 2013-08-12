require 'spec_helper'
require 'carrierwave/test/matchers'

describe Uploader do
  include CarrierWave::Test::Matchers

  before do
    @user = create(:user)
    Uploader.enable_processing = true
    @uploader = Uploader.new(@user, :image)
    @uploader.store!(File.open('spec/fixtures/images/green_tea_cake.jpg'))
  end

  after do
    Uploader.enable_processing = false
    @uploader.remove!
  end

  context 'the thumb version' do
    it "should scale down a landscape image to be exactly 40 by 40 pixels" do
      @uploader.thumb.should have_dimensions(40, 40)
    end
  end

  context 'the profile version' do
    it "should fit within 300 by 300 pixels" do
      @uploader.should be_no_larger_than(300, 300)
    end
  end
end