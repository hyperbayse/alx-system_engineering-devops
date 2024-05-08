#!/usr/bin/env ruby
# Output the matched occurrences of "hbtttn" with one or more 't's.
puts ARGV[0].scan(/hb?tn/).join
