require 'base64'
require 'mime/types'

module GenerateDataUri
  private
  
  # Use this in callbacks when the file is updated.
  def clear_data_uri_cache
    @_uri_cache = {}
  end
  
  def generate_data_uri(path)
    return @_uri_cache[path] if @_uri_cache && @_uri_cache[path]
  
    @_uri_cache ||= {}
    data = Base64.encode64(File.open(path, 'rb') {|f| f.read }).gsub(/\n/, '')
    content_type = MIME::Types.type_for(path).first
    
    @_uri_cache[path] = "data:#{content_type};charset=utf-8;base64,#{data}"
  end
end