GenerateDataUri
===============

Generate data-uris from files -- for example, files attached to a model.

These data-uris can be used as the "src" attribute on img tags, to avoid [triggering extra server requests](http://developer.yahoo.com/performance/rules.html#num_http). They can also be used in CSS as the content of the `url()` attribute for background images.

Most browsers (IE8+ and everything else) support data-uris that are smaller than 32k. Modern browsers support data-uris of any size. Obviously this can increase the size of your HTML page substantially (more than the size of the original image, in fact). However the tradeoff of increased size vs. more HTTP requests is often worth it for responsiveness, particularly if the images cannot be cached. Gzipping the response using your webserver will reduce the overhead to a few percent.

I've benchmarked the URI generation itself and it only adds a dozen or so milliseconds per file, even for large images.

See this Wikipedia page for details:

  http://en.wikipedia.org/wiki/Data_URI_scheme

Requires Ruby 1.9.2.

Usage (Rails)
-------------

  class User < ActiveRecord::Base
    has_attached_file :avatar
    
    def to_uri(style=:original)
      generate_data_uri avatar.path(style)
    end
  end
  
  # in view:
  
  tag :img, src: User.find(1).to_uri, alt: 'My Avatar'