require 'rubygems'
require 'lib/static_addthis'

old_defaults = StaticAddthis.defaults

describe StaticAddthis do
  before do
    StaticAddthis.defaults = old_defaults
  end

  describe :accessors do
    it "has defaults" do
      StaticAddthis.defaults = {:x => 1}
      StaticAddthis.defaults.should == {:x => 1}
    end
  end

  describe :icons do
    it "produces seperator" do
      StaticAddthis.icons(:providers => ['|']).should include("<span class=\"addthis_separator\">|</span>")
    end

    it "produces more" do
      StaticAddthis.icons(:providers => ['more']).should include(%{class="addthis_icon"})
    end

    it "produces a provider" do
      StaticAddthis.icons(:providers => ['Twitter']).should include(">Twitter<")
    end
  end

  describe :social_icon do
    it "finds correct offset" do
      StaticAddthis.social_icon('Twitter').should include('background-position: 0 -5232px')
    end
  end
end
