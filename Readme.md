Addthis without additional css / ajax-calls / backlinks.

    script/plugin install git://github.com/grosser/static_addthis.git

All the css you need is inside assets/static_addthis.css.
Copy assets/addthis_sprite.jpg to your public/images folder.

    <%= StaticAddthis.icons :providers => ['Facebook', 'Twitter', '|', 'more'], :username => '..', :uid => '..', :url => request.request_uri, :title => 'My website' %>

Author
======
[Michael Grosser](http://pragmatig.wordpress.com)  
grosser.michael@gmail.com  
Hereby placed under public domain, do what you want, just do not hold me accountable...