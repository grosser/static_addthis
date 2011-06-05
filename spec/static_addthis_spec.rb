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
      StaticAddthis.icons(defaults.merge(:providers => ['Twitter'])).should include(">Twitter<")
    end
  end

  describe :social_icon do
    it "finds correct offset" do
      StaticAddthis.social_icon('Twitter').should include('background-position: 0 -5232px')
    end
  end
end
