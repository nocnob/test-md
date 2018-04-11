#!/usr/bin/env ruby

require "rdoc"
require "rdoc/markup/to_html"

content = File.open('README.rdoc').read

if ::RDoc::VERSION.to_i >= 4
  h = ::RDoc::Markup::ToHtml.new(::RDoc::Options.new)
else
  h = ::RDoc::Markup::ToHtml.new
end

puts h.convert(content)
