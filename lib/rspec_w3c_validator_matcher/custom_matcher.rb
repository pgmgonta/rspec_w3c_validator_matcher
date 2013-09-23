require 'w3c_validators'
include W3CValidators

RSpec::Matchers.define :not_valid_in_3wc_validators do | doctype=:html32, charset=:utf_8 |
  match do |text|
    validator = MarkupValidator.new
    validator.set_doctype! doctype
    validator.set_charset! charset

    unless Dir.exists? 'tmp' ;Dir.mkdir 'tmp' end
    file_path = "tmp/w3c_validator#{Digest::MD5.hexdigest(text)}"
    File.write file_path, text

    results = validator.validate_file file_path

    unless results.errors.empty? 
      p text 
      results.errors.each do | err |
        p err.to_s
      end
    end

    unless results.warnings.empty? 
      p text 
      results.warnings.each do | warn |
        p warn.to_s
      end
    end
    File.delete file_path

    results.errors.empty?
  end
end
