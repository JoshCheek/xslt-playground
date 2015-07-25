# This is teh same as example.rb (see that one for explanatory comments)
# But it uses a gem, rouge, to add syntax highlighting.
# You can get it with `gem install rouge`

Dir.chdir File.expand_path('..', __FILE__)
require 'nokogiri'
xml  = Nokogiri::XML  File.read("hello_world.xml")
xslt = Nokogiri::XSLT File.read("hello_world.xsl")
html = xslt.apply_to xml



# Gem for syntax highlighting
require 'rouge'

# Have rouge make sense of the file as html
# You can see a list of lexers with `ruby -r rouge -e 'puts Rouge::Lexer.all'`
# but probably the only other one you'd be interested in is Rouge::Lexers::XML
lexer       = Rouge::Lexers::HTML.new
html_tokens = lexer.lex html

# And now format it for the terminal, using the colours from the theme "monokai"
# You can see a list of themes by running `ruby -r rouge -e 'puts Rouge::Theme.registry.keys'`
formatter        = Rouge::Formatters::Terminal256.new theme: 'monokai'
highlighted_html = formatter.format(html_tokens)

# and display it
puts highlighted_html
