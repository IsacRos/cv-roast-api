class PdfConverterService
  def self.convert(file_path, temp_file_path)

    pdf = Magick::Image.read(file_path) do |options|
      options.density = '200'
    end

    image = pdf.first

    image.write(temp_file_path)
  end
end