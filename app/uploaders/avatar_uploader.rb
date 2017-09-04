class AvatarUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick

  # Aids in generation of different versions of an image
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  #Can use AvatarUploader to store files:
  # uploader = AvatarUploader.new
  # uploader.store!(my_file)

  #OR to retrieve files:
  # uploader.retrieve_from_store!('my_file.png')

  ##store: permanent storage
  ##cache: temporary storage

  # u.save!
  # u.avatar.url # => '/url/to/file.png'
  # u.avatar.current_path # => 'path/to/file.png'
  # u.avatar_identifier # => 'file.png'

  # Note: u.avatar will never return nil, even if there is no photo associated to it. To check if a photo was saved to the model, use u.avatar.file.nil? instead.





  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_fit: [50, 50]
    # You can also add different versions using the same format.
  end

  ##
  # Only allow the following extensions
  # for or security purposes.
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
