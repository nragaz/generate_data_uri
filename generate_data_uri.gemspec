Gem::Specification.new do |s|
  s.name = "generate_data_uri"
  s.summary = "Turn a file into a string to embed as a data-uri in your HTML."
  s.description = "Turn a file into a string to embed as a data-uri in your HTML."
  s.files = Dir["lib/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.version = "0.0.1"
  s.authors = ["Nick Ragaz"]
  s.email = "nick.ragaz@gmail.com"
  s.homepage = "http://github.com/nragaz/generate_data_uri"
  
  s.add_dependency 'mime-types', '~> 1.1'
end
