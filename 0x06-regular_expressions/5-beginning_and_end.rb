#!/usr/bin/env ruby
# Output matched occurrences of "h_n" with any single character in place of _
puts ARGV[0].scan(/h.n/).join
