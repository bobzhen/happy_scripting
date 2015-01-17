require 'open-uri'
require 'uri'

# input arguments by using ARGV[N]
arg001 = ARGV[0]
# '../fetch_image_test.html'
html = open(arg001).read
image_array = URI.extract(html).select{ |l| l[/\.(?:gif|png|jpg)\b/]}
puts image_array.length
today = `date`
image_array.each do |i|
	unless i.nil?
		tmp = 'curl -O "' + i + '"'
		puts tmp.to_s
		system tmp
	end
end
