#!/usr/bin/env ruby

_, q = ENV["QUERY_STRING"].split('=', 2)
_, query = q.split(':', 2)

print "Content-type: text/plain\r\n"
print "W3m-control: GOTO http://www.google.co.jp/search?q=#{query}&hl=ja&biw=&bih=&gbv=1"
print "\r\n\r\n"
