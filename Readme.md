Faster page load time:

 - no additional js/css files
 - no js execution time
 - no flash tracking pixel from addthis
 - no backlinks to addthis (SEO)

Install
=======
    rails plugin install git://github.com/grosser/static_addthis.git

 - copy css from assets/static_addthis.css (0.2kb) to public and include it
 - copy assets/addthis_sprite.png into public/images

Usage
=====
    # setup (e.g. config/environment.rb)
    StaticAddthis.defaults = {
      :username => 'myaddthisusername',
      :uid => '12345'
    }

    # in view
    <%= StaticAddthis.icons :providers => ['Facebook', 'Twitter', '|', 'more'], :url => request.request_uri, :title => 'My website' %>

TODO
=====
 - add more providers <-> open image and lookup provider positions

Author
======
[Michael Grosser](http://grosser.it)<br/>
michael@grosser.it<br/>
Hereby placed under public domain, do what you want, just do not hold me accountable...<br/>
