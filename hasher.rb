#!/usr/bin/env ruby
require 'bcrypt'
require 'io/console'

#Hash a password using bycrypt
def hash_password(password)
  BCrypt::Password.create(password)
end

# Verifying the hash bit
def verify_password(stored_hash, candidate)
  BCrypt::Password.new(stored_hash) == candidate
end

# CLI demonstration
puts "Choose: hash / verify"
choice = STDIN.gets.chomp

case choice
when 'hash'
  print "Enter password: "
  pw = STDIN.noecho(&:gets).chomp
  puts "\nHashed password: #{hash_password(pw)}"
when 'verify'
  print "Stored hash: "
  stored = STDIN.gets.chomp
  print "Password to verify: "
  pw = STDIN.noecho(&:gets).chomp
  puts "\nMatch? #{verify_password(stored, pw)}"
else
  puts "Unknown option"
end
