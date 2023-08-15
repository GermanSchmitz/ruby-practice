# frozen_string_literal: true
require 'minitest/autorun'
require_relative '../lib/password_generator'

class TestPasswordGen < Minitest::Test

  def setup
    @password_generator = PasswordGenerator.new
  end

  def test_password_only_lowercase
    password = @password_generator.generate_secure_password(20, true, false, false, false)
    assert_match(/[a-z]+/, password)
  end

  def test_generate_pass_uppercase
    password = @password_generator.generate_secure_password(20, false, true, false, false)
    assert_match(/[A-Z]+/, password)
  end

  def test_generate_password_digits
    password = @password_generator.generate_secure_password(20, false, false, true, false)
    assert_match(/\d+/, password)
  end

  def test_gen_pass_specialchars
    password = @password_generator.generate_secure_password(20, false, false, false, true)
    assert_match(/[\W_]+/, password)
  end

  def test_generate_pass_security
    50.times do
      password = @password_generator.generate_secure_password(20, true, true, true, true)
      assert_match(/[a-zA-Z\d\W_]+/, password)
      assert_match(/[a-z]+/, password)
      assert_match(/[A-Z]+/, password)
      assert_match(/\d+/, password)
      assert_match(/[\W_]+/, password)
    end
  end
end
