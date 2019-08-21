class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true # Force version generation at upload time.

  # process convert: 'jpg'

  process resize_to_fit: [300, 300]

  version :avatar do
    cloudinary_transformation transformation: [
      { width: 400, height: 400, gravity: :face, radius: :max, crop: :thumb },
      { width: 200, height: 200, crop: :thumb }
    ]
  end

  version :bright_face do
    cloudinary_transformation radius: 20,
      width: 150, height: 150, crop: :thumb, gravity: :face
  end
end
