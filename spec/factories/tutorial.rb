Factory.define :tutorial do |f|
  f.title              "title"
  f.body               "some cool body"
  f.ruby_gems {|a| [a.association(:ruby_gem)]}
  f.association :user, :factory => :user
end
