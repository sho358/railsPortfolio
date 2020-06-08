class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  storage :file
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default(*arges)
    "/images/" + [version_name, "dafelut.jpg"].compact.join('_')
  end

  version :thumb400 do
    process resize_and_pad(400, 400, background = :transparent, gravity = 'Center')
  end

  version :thumb200 do 
    process resize_to_fill: [300, 200, "Center"]
  end
  
  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
