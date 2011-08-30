Factory.define :ruby_gem do |f|
  f.sequence(:name) {|n| "Ruby Gem#{n}" }
end


