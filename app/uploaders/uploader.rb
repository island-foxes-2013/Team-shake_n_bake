class Uploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process :resize_to_fill => [200, 200]

  version :thumb do
    process :resize_to_fill => [40, 40]
  end
  
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
end