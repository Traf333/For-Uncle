# encoding: utf-8

namespace :db do 
  desc "Fill database with sample data" 
  task populate: :environment do
    make_client
    make_operations
    make_seller
  end
end


def make_client
  99.times do 
    name = Faker::Name.name
    credit_limit = 5000
    Client.create!(name: name, credit_limit: credit_limit)
  end
end

def make_operations
  clients = Client.all(limit: 5)
  30.times do |n|
    value = (15..50).to_a.shuffle
    clients.each { |client| client.operations.create!(value: value.first, coment: "Мороженое") }
  end
end

def make_seller
  admin = Seller.create!(name: "Титаренко Леонид",
                         password: "123456",  
                         password_confirmation: "123456")
  admin.toggle!(:admin)
  3.times do
    name = Faker::Name.name
    password = "password"
    Seller.create!(name: name,
                         password: password,  
                         password_confirmation: password)
  end
end