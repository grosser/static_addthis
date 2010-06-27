Faster page load time:

 - no additional js/css files
 - no js execution time
 - no flash tracking pixel from addthis
 - no backlinks to addthis (SEO)

Install
=======
    script/plugin install git://github.com/grosser/static_addthis.git

Copy css from assets/static_addthis.css  
Copy assets/addthis_sprite.jpg into public/images

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
[Michael Grosser](http://pragmatig.wordpress.com)  
grosser.michael@gmail.com  
Hereby placed under public domain, do what you want, just do not hold me accountable...