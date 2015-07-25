# Example of using Nokogiri to quickly play with XSLT
# example from https://msdn.microsoft.com/en-us/library/ms765388(v=vs.85).aspx

# cd to this dir, so that we can find the files, regardless of where you run it from
Dir.chdir File.expand_path('..', __FILE__)


# Gem for working with xml, you can get it with `gem install nokogiri`, docs are at http://www.nokogiri.org/
require 'nokogiri'

# Load the xml and xslt
# The strange syntax is because XML and XSLT are actually methods that begin with capital letters,
# we are passing them the file bodies as arguments)
xml  = Nokogiri::XML  File.read("hello_world.xml")
xslt = Nokogiri::XSLT File.read("hello_world.xsl")

# use the xslt to transform the xml into html
html = xslt.apply_to xml

# display it
puts html
