class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def default_url
    ActionController::Base.helpers.asset_path("avatar.png")
  end
end
