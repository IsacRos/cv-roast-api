class FileHandlerService

  def make_temp_image(file)
    if file.content_type == "application/pdf"
      temp_file = Tempfile.new(["cv_image", ".jpg", binmode: true])
      convert_to_pdf(file.tempfile.path, temp_file.path)
      return temp_file
    elsif ["image/jpeg", "image/png" ].include?(file.content_type)
      return file
    else
      raise StandardError, "Wrong file type"
    end
  end

  def convert_to_pdf(file_path, temp_file_path)
    pdf = Magick::Image.read(file_path) do |options|
      options.density = '200'
    end

    image = pdf.first
    image.write(temp_file_path)
  end
end