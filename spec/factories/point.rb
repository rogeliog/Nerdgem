Factory.define :point do |f|
  f.association :user, :factory => :user
  f.association :tutorial, :factory => :tutorial
end
