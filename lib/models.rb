require "data_mapper"

class User
  include DataMapper::Resource
  
  property :id,       Serial
  property :firstname,     String
  property :lastname,     String
  
  has n,   :accounts
  
end

class Account
  include DataMapper::Resource

  property :id,       Serial
  property :balance,  Float
  
  has n,   :transactions
  belongs_to :user
  
end

class Transaction
  include DataMapper::Resource
  
  property :id,       Serial
  property :date,     DateTime
  property :amount,   Float
  
  belongs_to :account
  
end

