class BookUploader < CarrierWave::Uploader::Base
  storage :aws

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

      def filename
        if original_filename
          if model && model.read_attribute(mounted_as).present?
            model.read_attribute(mounted_as)
          else
            @name ||= "#{mounted_as}-#{uuid}.#{file.extension}"
          end
        end
      end

  protected

      def uuid
        UUID.state_file = false
        uuid = UUID.new
        uuid.generate
      end


end
