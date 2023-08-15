# frozen_string_literal: true
require_relative 'password_generator'

password_generator = PasswordGenerator.new

loop do
  puts "\nPassword Generator"
  print "Enter desired password length: "
  length = gets.chomp.to_i

  print "Include lowercase characters? (y/n): "
  use_lowercase = gets.chomp.downcase == 'y'

  print "Include uppercase characters? (y/n): "
  use_uppercase = gets.chomp.downcase == 'y'

  print "Include digit characters? (y/n): "
  use_digits = gets.chomp.downcase == 'y'

  print "Include special characters? (y/n): "
  use_special = gets.chomp.downcase == 'y'

  password = password_generator.generate_secure_password(length, use_lowercase, use_uppercase, use_digits, use_special)
  puts "\nGenerated Password: #{password}"

  print "Generate another password? (y/n): "
  continue = gets.chomp.downcase
  break if continue != 'y'
end