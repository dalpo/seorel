# encoding: utf-8
module Seorel
  class ImageUploader < CarrierWave::Uploader::Base

    # Include RMagick or MiniMagick support:
    # include CarrierWave::RMagick
    # include CarrierWave::Processing::RMagick
    include CarrierWave::MiniMagick

    # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
    include Sprockets::Helpers::RailsHelper
    include Sprockets::Helpers::IsolatedHelper

    # Choose what kind of storage to use for this uploader:
    storage :file
    # storage :fog

    # Override the directory where uploaded files will be stored.
    # This is a sensible default for uploaders that are meant to be mounted:
    def store_dir
      File.join('system', model.class.to_s.underscore.to_s, mounted_as.to_s, model.id.to_s)
    end

    # Provide a default URL as a default if there hasn't been a file uploaded:
    def default_url
      # For Rails 3.1+ asset pipeline compatibility:
      asset_path('seorel/default.jpg')
    end

    process convert: 'jpeg'

    version :thumbnail do
      process resize_to_fill: [150, 150]
    end

    version :default do
      process resize_and_pad: [300, 300, '#ffffff']
    end

    # Add a white list of extensions which are allowed to be uploaded.
    # For images you might use something like this:
    def extension_white_list
      %w(jpg jpeg gif png bmp tif tiff)
    end

    # Override the filename of the uploaded files:
    # Avoid using model.id or version_name here, see uploader/store.rb for details.
    # def filename
    #   "something.jpg" if original_filename
    # end

  end
end
