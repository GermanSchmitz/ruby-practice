# frozen_string_literal: true

class PasswordGenerator

  LOWERCASE_CHARACTERS = ('a'..'z').to_a
  UPPERCASE_CHARACTERS = ('A'..'Z').to_a
  DIGIT_NUMBERS = ('0'..'9').to_a
  SPECIAL_CHARACTERS = %w[! @ # $ % ^ & * ( ) - _ + =]

  def generate_secure_password(pass_length, use_lowercase, use_uppercase, use_digits, use_specialchars)
    return 'password length cannot be 0' if pass_length == 0
    characters = []
    characters.push(LOWERCASE_CHARACTERS) if use_lowercase
    characters.push(UPPERCASE_CHARACTERS) if use_uppercase
    characters.push(DIGIT_NUMBERS) if use_digits
    characters.push(SPECIAL_CHARACTERS) if use_specialchars

    return 'No password preferences selected.' if characters.empty?

    password = String.new
    j = 0
    (1..pass_length).each {
      password << characters[j].sample
      j += 1
      if j == characters.length
        j = 0
      end
    }
    password.split('').shuffle.join
  end
end
