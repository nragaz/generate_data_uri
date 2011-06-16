require "test/unit"
require "bundler"

Bundler.require

class AttachmentContainer
  include GenerateDataUri
  
  def to_uri
    generate_data_uri File.expand_path("../fixtures/test.png", __FILE__)
  end
end

class GenerateDataUriTest < Test::Unit::TestCase
  def test_kind_of_content
    data_uri = AttachmentContainer.new.to_uri
    
    assert_kind_of String, data_uri
  end
  
  def test_mime_type
    data_uri = AttachmentContainer.new.to_uri
    
    assert data_uri =~ /image\/png/
  end
end
