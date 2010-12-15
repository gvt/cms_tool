
Factory.define :element do |f| 
  f.name 'On the Electrodynamics of Moving Bodies'
  f.body  'Some very important words.'
  f.association :owner, :factory => :user
end

Factory.define :user do |f|
  f.login  'log_name'           
  f.crypted_password 'secret' 
  f.password 'secret'
  f.password_confirmation 'secret'
  f.password_salt 'secret'    
  f.persistence_token 
  f.perishable_token
end