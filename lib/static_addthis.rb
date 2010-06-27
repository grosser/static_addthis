require 'cgi'

module StaticAddthis
  class << self
    attr_accessor :defaults
  end
  self.defaults = {
    :providers => %w[Facebook Twitter | more],
    :title => 'Add :title',
    :url => 'Add :url',
    :username => 'Add :username',
    :uid => 'Add :uid'
  }

  def self.icons(options)
    options = defaults.merge(options)

    url = CGI.escape(options[:url])
    title = CGI.escape(options[:title])
    username = options[:username]
    uid = options[:uid]

    providers = options[:providers].map do |provider|
      url_with_tracking = CGI.escape("#{url}?partnerid=add_this&utm_source=add_this&utm_medium=#{provider}")

      case provider.to_s
      when '|' then
        %{<span class="addthis_separator">|</span>}
      when 'more'
        href = "http://www.addthis.com/bookmark.php?v=250&amp;username=#{username}"
        text = social_icon('addthis', :title => '+')
        link_to text, href, :rel => :nofollow
      else
        text = provider.capitalize
        href = "//www.addthis.com/bookmark.php?pub=#{username}&amp;v=250&amp;source=tbx-250&amp;tt=0&amp;s=#{provider}&amp;url=#{url_with_tracking}&amp;title=#{title}&amp;content=&amp;uid=#{uid}"
        text = (options[:only_text] ? text : "#{social_icon(provider)}#{text}")
        link_to text, href, :target => :blank, :rel => :nofollow 
      end
    end

    <<-HTML
      <div class="addthis_toolbox">
        #{providers}
        <div style="clear:both"></div>
      </div>
    HTML
  end

  def self.social_icon(provider, options={})
    providers = {
      'facebook' => 3424,
      'twitter' => 3217,
      'edelight' => 3584,
      'delicious' => 144,
      'misterwongde' => 1136,
      'google' => 1344,
      'stylehive' => 4192,
      'addthis' => 0
    }
    offset = providers[provider.to_s.downcase]
    return '' unless offset
    title = provider.to_s.capitalize
    options = {:class => 'addthis_icon', :style => "background-position: 0 #{-1*offset}px", :title => title}.merge(options)
    content_tag :span, '&nbsp;', options
  end

  private

  def self.link_to(name, href, options={})
    content_tag :a, name, options.merge(:href => href)
  end

  def self.content_tag(name, content, options={})
    options = options.map{|k,v| %{#{k}="#{v.to_s.gsub('"','`')}"}} * ' '
    "<#{name} #{options}>#{content}</#{name}>"
  end
end