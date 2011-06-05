require 'rubygems'
require 'lib/static_addthis'

describe StaticAddthis do
  let(:defaults){ {:url => 'asdadas', :title => 'xxczx', :uid => '1121', :username => 'asdads'} }

  describe :icons do
    it "produces seperator" do
      StaticAddthis.icons(defaults.merge(:providers => ['|'])).should include("<span class=\"addthis_separator\">|</span>")
    end

    it "produces more" do
      StaticAddthis.icons(defaults.merge(:providers => ['more'])).should include(%{class="addthis_icon"})
    end

    it "produces a provider" do
      StaticAddthis.icons(defaults.merge(:providers => ['Twitter'], :show_text => true)).should include(">Twitter<")
    end

    it "overwrites %{provider} in url" do
      StaticAddthis.icons(defaults.merge(:providers => ['Twitter'], :url => 'xxx%{provider}yyy')).should include("xxxTwitteryyy")
    end

    it "ignores unknown providers so I can gsub them" do
      result = StaticAddthis.icons(defaults.merge(:providers => ['Foo']))
      result.should_not include(">Foo<")
      result.should include("Foo\n")
    end

    it "does not show icons with only_text option" do
      result = StaticAddthis.icons(defaults.merge(:providers => ['Twitter','more'], :only_text => true))
      result.should_not include(%{class="addthis_icon"})
    end

    it "supports custom translations" do
      result = StaticAddthis.icons(defaults.merge(:providers => ['Twitter'], :text => "Share on %{provider}"))
      result.should include('Share on Twitter')
    end
  end

  describe :social_icon do
    it "finds correct offset" do
      StaticAddthis.social_icon('Twitter').should include('background-position: 0 -5232px')
    end
  end
end
