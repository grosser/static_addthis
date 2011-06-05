Advantages:

 - Pagespeed: no additional js/css files + no js execution time
 - Security: no flash tracking pixel from addthis
 - Offline access: everything working without an internet connection
 - SEO: no backlinks to addthis

Install
=======
    rails plugin install git://github.com/grosser/static_addthis.git

 - copy css from assets/static_addthis.css (0.2kb) to public and include it
 - copy assets/addthis_sprite.png into public/images

Usage
=====

    # app/helpers/application_helper.rb
    def add_this(options)
      StaticAddthis.icons(options.reverse_merge(
        :title => @page_title,
        :url => request.request_uri,
        :username => 'myaddthisusername',
        :uid => '12345'
      ))
    end

    # in view
    <%= add_this :providers => ['Facebook', 'Twitter', '|', 'more'] %>

Author
======
[Michael Grosser](http://grosser.it)<br/>
michael@grosser.it<br/>
Hereby placed under public domain, do what you want, just do not hold me accountable...<br/>
