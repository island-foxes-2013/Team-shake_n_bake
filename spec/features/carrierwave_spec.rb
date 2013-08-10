require 'carrierwave/test/matchers'

describe Uploader do
  include CarrierWave::Test::Matchers

  before do
    Uploader.enable_processing = true
    @uploader = Uploader.new(@user, :image)
    @uploader.store!(File.open(path_to_file))
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
    it "should fit within 200 by 200 pixels" do
      @uploader.should be_no_larger_than(200, 200)
    end
  end

  it "should make the image readable only to the owner and not executable" do
    @uploader.should have_permissions(0600)
  end
end