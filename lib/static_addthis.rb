module StaticAddthis
  def self.icons(options)
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
        text = provider.humanize
        href = "//www.addthis.com/bookmark.php?pub=#{username}&amp;v=250&amp;source=tbx-250&amp;tt=0&amp;s=#{provider}&amp;url=#{url_with_tracking}&amp;title=#{title}&amp;content=&amp;lng=#{I18n.locale}&amp;uid=#{uid}"
        text = (options[:only_text] ? text : "#{social_icon(provider)}#{text}")
        link_to text, href, :target => :blank, :rel => :nofollow
      end
    end

    <<-HTML
      <div class="addthis_toolbox">
        #{providers}
        #{clearer}
      </div>
    HTML
  end

  def self.social_icon(provider, options={})
    providers = {
      'facebook' => 3424,
      'twitter' => 3217,
      'edelight' => 3584,
      'delicious' => 144,
      'misterwong_de' => 1136,
      'google' => 1344,
      'stylehive' => 4192,
      'addthis' => 0
    }
    offset = providers[provider.to_s.underscore]
    return '' unless offset
    title = provider.to_s.titleize
    content_tag :span, '&nbsp;', options.reverse_merge(:class => 'addthis_icon', :style => "background-position: 0 #{-1*offset}px", :title => title)
  end
end