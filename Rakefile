task :default do
  exec "rspec spec/"
end

task :refresh_icons do
  icon_set = '.at15t'
  css = "http://s7.addthis.com/static/r07/widget59.css"
  css = `curl #{css}`

  css_rules = css.split('}').map(&:strip)
  puts "found #{css_rules.size} rules"

  # find all simple class rules
  css_rules = css_rules.map do |rule|
    next unless match = rule.match(/^(\.[_a-z\d]+)\s*\{/)
    [match[1], rule.sub(match[0],'')]
  end.compact
  css_rules = Hash[css_rules]

  puts "extracted #{css_rules.size} simple rules"

  # find png location
  png = 'http:' + css_rules[icon_set][%r{//.*?\.png}]
  puts "using image #{png}"
  `curl #{png} > assets/addthis_sprite.png`

  # extract background offset info
  icons = css_rules.map do |klass, css|
    puts klass+css
    next unless klass+css =~ /^#{icon_set}_([_a-z]+)background-position:0 -(\d+)px/
    [$1, $2.to_i]
  end.compact.sort
  icons = Hash[icons]

  puts icons.inspect
  puts "now paste this into lib/static_addthis.rb"
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = 'static_addthis'
    gem.summary = "Fast Addthis: no external js/css/images +  no backlinks to addthis"
    gem.email = "michael@grosser.it"
    gem.homepage = "http://github.com/grosser/#{gem.name}"
    gem.authors = ["Michael Grosser"]
  end

  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available. Install it with: gem install jeweler"
end
