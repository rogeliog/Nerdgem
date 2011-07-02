system "gem list --remote | awk \'{print $1}\' >> #{Rails.root}/db/csv/gem_list"
gems=File.open("#{Rails.root}/db/csv/gem_list")
puts "Gems where fetched correctly\nStart seeeding"
gems.each { |g| RubyGem.find_or_create_by_name(g.to_s[0..-2]) }
