# config/initializers/pdfkit.rb
PDFKit.configure do |config|
  config.wkhtmltopdf = Rails.root.join('vendor', 'wkhtmltopdf-i386').to_s
end