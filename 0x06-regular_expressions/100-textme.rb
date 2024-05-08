#!/usr/bin/env ruby
# Output the matched occurrences of "School"
puts ARGV[0].scan(/(?<=from|to|flags):(\+?\w+|[-?[0-1]:?]+)/).join(',')
