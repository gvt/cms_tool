Factory.define :element do |f| 
  f.sequence(:name) {|n| "Succintly named #{n}" }
  f.body  'On the Electrodynamics of Moving Bodies ...'
  f.publish_effective_at "2013-02-15 23:35:00"
  f.association :account
end

Factory.define :user do |f|
  f.sequence(:login) {|n| "login#{n}" }
  f.crypted_password 'secret'
  f.password 'secret'
  f.password_confirmation 'secret'
  f.password_salt 'secret'
  f.sequence(:persistence_token) {|n| "asdqweasdqweasdqwe#{n}" }
  f.perishable_token
  f.accounts {|u| [u.association(:account)]}
end

Factory.define :account do |f| 
  f.sequence(:name) {|n| "Banana Seller #{n}"}
end

