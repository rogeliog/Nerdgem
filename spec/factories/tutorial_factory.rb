
Factory.define :tutorial do |f|
  f.title              "title"
  f.body               "some cool body"
  f.association        :user, :factory => :user
end
