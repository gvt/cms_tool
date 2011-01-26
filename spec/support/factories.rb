Factory.define :element do |f| 
  f.name 'On the Electrodynamics of Moving Bodies'
  f.body  'Some very important words.'
  f.association :owner, :factory => :user
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
end

