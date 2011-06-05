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
      # add google analytics tracking
      url = request.request_uri
      url += url.include?('?') ? '&' : '?'
      url += 'utm_source=add_this&utm_medium=%{provider}'

      StaticAddthis.icons(options.reverse_merge(
        :title => @page_title,
        :url => request.request_uri,
        :username => 'myaddthisusername',
        :uid => '12345'
      ))
    end

    # in view
    <%= add_this :providers => ['Facebook', 'Twitter', '|', 'more'] %>

    # customize: add a unknown provider and use .sub
    <%= add_this(:providers => ['Twitter', 'MyStuff', 'more']).sub('MyStuff', link_to('MyStuff', '/my_stuff')) %>

    # without icons
    <%= add_this :providers => ['more'], :only_text => true %>

    # just need some icons ?
    <%= StaticAddthis.social_icon('Facebook') %>


Author
======
[Michael Grosser](http://grosser.it)<br/>
michael@grosser.it<br/>
Hereby placed under public domain, do what you want, just do not hold me accountable...<br/>
