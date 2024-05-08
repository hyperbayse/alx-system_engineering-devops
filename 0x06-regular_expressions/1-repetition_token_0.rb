#!/usr/bin/env ruby
# # Output the matched occurrences of "hbttn" with 2 to 5 't's.
puts ARGV[0].scan(/hbt{2,5}n/).join
