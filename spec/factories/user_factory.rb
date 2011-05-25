Factory.define :user do |f|
  f.password              "secret"
  f.password_confirmation "secret"
  f.sequence(:email) {|n| "member#{n}@nerdgem.com" }
end
