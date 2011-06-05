require 'cgi'

module StaticAddthis
  ICON_OFFSETS = {"addio"=>112, "addressbar"=>128, "adfty"=>160, "adifni"=>176, "aerosocial"=>192, "aim"=>208, "allmyfaves"=>224, "amazonwishlist"=>240, "amenme"=>256, "aolmail"=>272, "armenix"=>288, "arto"=>304, "aviary"=>320, "baang"=>336, "baidu"=>352, "bebo"=>368, "bentio"=>384, "biggerpockets"=>400, "bitly"=>416, "bizsugar"=>432, "bleetbox"=>448, "blinklist"=>464, "blip"=>480, "blogger"=>496, "bloggy"=>512, "blogmarks"=>528, "blogtrottr"=>544, "blurpalicious"=>560, "boardlite"=>576, "bobrdobr"=>592, "bonzobox"=>608, "bookmarkedbyus"=>624, "bookmarkycz"=>640, "bookmerkende"=>656, "bordom"=>672, "box"=>688, "brainify"=>704, "bryderi"=>720, "buddymarks"=>736, "buzzzy"=>752, "camyoo"=>768, "cardthis"=>784, "chiq"=>816, "cirip"=>832, "citeulike"=>848, "classicalplace"=>864, "clickazoo"=>880, "clply"=>896, "cndig"=>912, "colivia"=>928, "compact"=>3440, "connotea"=>944, "cootopia"=>960, "cosmiq"=>976, "curateus"=>992, "dashboard"=>1008, "delicious"=>1024, "designbump"=>1040, "designmoo"=>1056, "digaculturanet"=>1072, "digg"=>1088, "diggita"=>1104, "diggtiger"=>1120, "diglog"=>1136, "digo"=>1152, "digthiswebhost"=>1168, "digzign"=>1184, "diigo"=>1200, "dipdive"=>1216, "domaintoolswhois"=>1232, "domelhor"=>1248, "dosti"=>1264, "dotnetkicks"=>1280, "dotnetshoutout"=>1296, "douban"=>1312, "draugiem"=>1328, "drimio"=>1344, "dropjack"=>1360, "dwellicious"=>1376, "dzone"=>1392, "edelight"=>1408, "efactor"=>1424, "ekudos"=>1440, "elefantapl"=>1456, "email"=>1472, "embarkons"=>1488, "eucliquei"=>1504, "evernote"=>1520, "expanded"=>3440, "extraplay"=>1536, "ezyspot"=>1552, "facebook"=>1584, "facebook_like"=>1600, "fark"=>1616, "farkinda"=>1632, "fashiolista"=>1648, "fashionburner"=>1664, "favable"=>1680, "faves"=>1696, "favicon"=>1712, "favlogde"=>1728, "favoritende"=>1744, "favorites"=>1760, "favoritus"=>1776, "flaker"=>1792, "flickr"=>1808, "flosspro"=>1824, "folkd"=>1840, "followtags"=>1856, "forceindya"=>1872, "formspring"=>1888, "fresqui"=>1904, "friendfeed"=>1920, "friendster"=>1936, "funp"=>1952, "fwisp"=>1968, "gabbr"=>1984, "gacetilla"=>2000, "gamekicker"=>2016, "givealink"=>2032, "globalgrind"=>2048, "gluvsnap"=>2064, "gmail"=>2080, "goodnoows"=>2096, "google"=>2112, "googlebuzz"=>2128, "googlereader"=>2144, "googletranslate"=>2160, "gravee"=>2176, "greaterdebater"=>2192, "grono"=>2208, "grumper"=>2224, "habergentr"=>2240, "hackernews"=>2256, "hadashhot"=>2272, "hatena"=>2288, "hazarkor"=>2304, "hedgehogs"=>2320, "hellotxt"=>2336, "hipstr"=>2368, "historious"=>2384, "hitmarks"=>2400, "hotbookmark"=>2416, "hotklix"=>2432, "hotmail"=>2448, "hyves"=>2464, "idearef"=>2480, "identica"=>2496, "igoogle"=>2512, "ihavegot"=>2528, "indexor"=>2560, "informazione"=>2576, "instapaper"=>2592, "investorlinks"=>2608, "iorbix"=>2624, "isociety"=>2640, "iwiw"=>2656, "jamespot"=>2672, "jappy"=>2688, "jisko"=>2704, "joliprint"=>2720, "jumptags"=>2736, "kaboodle"=>2752, "kaevur"=>2768, "kaixin"=>2784, "kipup"=>2800, "kirtsy"=>2816, "kledy"=>2832, "kommenting"=>2848, "laaikit"=>2864, "ladenzeile"=>2880, "latafaneracat"=>2896, "librerio"=>2912, "linkagogo"=>2928, "linkedin"=>2944, "linkninja"=>2960, "linksgutter"=>2976, "linkshares"=>2992, "linksnapr"=>3008, "linkstore"=>3024, "linkuj"=>3040, "live"=>3056, "livefavoris"=>3072, "livejournal"=>3088, "lockerblogger"=>3104, "lynki"=>3136, "mailto"=>3152, "markme"=>3168, "mashbord"=>3184, "mawindo"=>3200, "meccho"=>3216, "meinvz"=>3232, "mekusharim"=>3248, "memonic"=>3264, "memori"=>3280, "meneame"=>3296, "menu"=>3312, "mindbodygreen"=>3328, "misterwong"=>3344, "misterwong_de"=>3360, "misterwong_ru"=>3376, "mixx"=>3392, "moemesto"=>3408, "moikrug"=>3424, "more"=>3440, "mototagz"=>3456, "mrcnetworkit"=>3472, "mssocialbookmarks"=>3488, "multiply"=>3504, "myaol"=>3520, "myhayastan"=>3536, "mylinkvault"=>3552, "mymailru"=>3568, "mynasa"=>3584, "myspace"=>3600, "myyearbook"=>3616, "naszaklasa"=>3648, "netlog"=>3664, "netvibes"=>3680, "netvouz"=>3696, "newsmeback"=>3712, "newstrust"=>3728, "newsvine"=>3744, "nujij"=>3760, "odnoklassniki_ru"=>3776, "oknotizie"=>3792, "olddogg"=>3808, "oneview"=>3824, "ongobee"=>3840, "orkut"=>3856, "osmosus"=>3872, "oyyla"=>3888, "packg"=>3904, "pafnetde"=>3920, "pdfmyurl"=>3936, "pdfonline"=>3952, "phonefavs"=>3968, "pimpthisblog"=>3984, "pingfm"=>4000, "planypus"=>4016, "plaxo"=>4032, "plurk"=>4048, "pochvalcz"=>4064, "popedition"=>4080, "posteezy"=>4096, "posterous"=>4112, "pratiba"=>4128, "print"=>4144, "printfriendly"=>4160, "pusha"=>4176, "qrfin"=>4192, "quantcast"=>4208, "qzone"=>4224, "readitlater"=>4240, "reddit"=>4256, "rediff"=>4272, "redkum"=>4288, "ridefix"=>4304, "rss"=>4320, "scoopat"=>4336, "segnalo"=>4352, "sekoman"=>4368, "shaveh"=>4400, "shetoldme"=>4416, "shirintar"=>4432, "simpy"=>4448, "sinaweibo"=>4464, "slashdot"=>4480, "smiru"=>4496, "socialbookmarkingnet"=>4512, "sodahead"=>4528, "sonico"=>4544, "speedtile"=>4560, "sphinn"=>4576, "spinsnap"=>4592, "spokentoyou"=>4608, "sportpost"=>4624, "springpad"=>4640, "spruzer"=>4656, "squidoo"=>4672, "startaid"=>4688, "startlap"=>4704, "storyfollower"=>4720, "studivz"=>4736, "stuffpit"=>4752, "stumbleupon"=>4768, "stumpedia"=>4784, "stylehive"=>4800, "surfpeoplenet"=>4816, "svejo"=>4832, "symbaloo"=>4848, "taaza"=>4864, "tagmarksde"=>4880, "tagvn"=>4896, "tagza"=>4912, "tailrank"=>4928, "tarpipe"=>4944, "technerd"=>4960, "teknikim"=>4976, "tellmypolitician"=>4992, "thefreedictionary"=>5008, "thewebblend"=>5024, "thinkfinity"=>5040, "thisnext"=>5056, "throwpile"=>5072, "tipd"=>5088, "topsitelernet"=>5104, "transferr"=>5120, "tuenti"=>5136, "tulinq"=>5152, "tumblr"=>5168, "tusul"=>5184, "tvinx"=>5200, "tweetmeme"=>5216, "twitter"=>5232, "twitthis"=>5248, "typepad"=>5264, "upnews"=>5280, "urlaubswerkde"=>5296, "viadeo"=>5312, "virb"=>5328, "visitezmonsite"=>5344, "vk"=>5360, "vkrugudruzei"=>5376, "voxopolis"=>5392, "vybralisme"=>5408, "vyoom"=>5424, "webnews"=>5456, "webs"=>5472, "windows"=>5488, "windycitizen"=>5504, "wirefan"=>5520, "wordpress"=>5536, "worio"=>5552, "woscc"=>5568, "wykop"=>5584, "xanga"=>5600, "xing"=>5616, "yahoobkm"=>5632, "yahoomail"=>5648, "yammer"=>5664, "yardbarker"=>5680, "yemle"=>5696, "yigg"=>5712, "yiid"=>5728, "yoolink"=>5744, "yorumcuyum"=>5760, "youblr"=>5776, "youbookmarks"=>5792, "youmob"=>5808, "youtube"=>5824, "yuuby"=>5840, "zakladoknet"=>5856, "zanatic"=>5872, "ziczac"=>5888, "zingme"=>5904, "zooloo"=>5920, "zootool"=>5936}

  def self.icons(options)
    providers = options[:providers].map{|p| link_to_provider(p, options) }

    <<-HTML
      <div class="addthis_toolbox">
        #{providers}
        <div style="clear:both"></div>
      </div>
    HTML
  end

  def self.social_icon(provider, options={})
    return '' unless offset = icon_offset(provider)
    title = provider.to_s.capitalize
    options = {:class => 'addthis_icon', :style => "background-position: 0 #{-1*offset}px", :title => title}.merge(options)
    content_tag :span, '&nbsp;', options
  end

  def self.link_to_provider(name, options)
    url = options[:url] || raise('addthis needs :url')
    url = CGI.escape(url.gsub('%{provider}', name))
    title = CGI.escape(options[:title] || raise('addthis needs :title'))
    username = options[:username] || raise('addthis needs :username')
    uid = options[:uid] || raise('addthis needs :uid')

    case name.to_s
    when '|' then
      %{<span class="addthis_separator">|</span>}
    when 'more'
      href = "http://www.addthis.com/bookmark.php?v=250&amp;username=#{username}"
      text = '+'
      icon = social_icon('more', :title => text)
      text = (options[:only_text] ? text : "#{icon}#{text}")
      link_to text, href, :target => :blank, :rel => :nofollow
    else
      if known_provider?(name)
        text = name.capitalize
        href = "//www.addthis.com/bookmark.php?pub=#{username}&amp;v=250&amp;source=tbx-250&amp;tt=0&amp;s=#{name}&amp;url=#{url}&amp;title=#{title}&amp;content=&amp;uid=#{uid}"
        icon = social_icon(name, :title => text)
        text = (options[:only_text] ? text : "#{icon}#{text}")
        link_to text, href, :target => :blank, :rel => :nofollow
      else
        name
      end
    end
  end

  private

  def self.icon_offset(provider)
    ICON_OFFSETS[provider.to_s.downcase]
  end

  def self.known_provider?(provider)
    !!icon_offset(provider)
  end

  def self.link_to(name, href, options={})
    content_tag :a, name, options.merge(:href => href)
  end

  def self.content_tag(name, content, options={})
    options = options.map{|k,v| %{#{k}="#{v.to_s.gsub('"','`')}"}} * ' '
    "<#{name} #{options}>#{content}</#{name}>"
  end
end
