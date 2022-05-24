#!/usr/bin/env ruby

require "cgi"

cgi = CGI.new

from = cgi["from"].to_i
to = cgi["to"].to_i

number = rand(to - from + 1) + from 

puts cgi.header
puts "<html><body>#{number}</html>"

<form method="POST" action="http://www.blaaaah.com/test.cgi">
  For a number between
    <input type="text" name="from" value="" />
    and
    <input type="text" name="to" value="" />
    <input type="submit" value="Click here!" />
</form>
