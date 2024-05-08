#!/usr/bin/env ruby
# Output the matched occurrences of "hbtn" with zero or more 't's.
puts ARGV[0].scan(/hbt+n/).join
