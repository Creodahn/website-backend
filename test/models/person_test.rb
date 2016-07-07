require "test_helper"

class PersonTest < ActiveSupport::TestCase
  def setup
    @person = Person.new(first_name: "Justin", last_name: "Drew", title: "Web Developer", birth_date: DateTime.strptime("12/28/1986", "%m/%d/%Y"), description: "I am a web developer who is familiar with all aspects of the web application stack, from the front end to database design. I have worked both in teams and independently, and can work effectively and efficiently in either situation.", email: "justin@justindrew.net", location: "Rhinebeck, NY", password: "testTEST", password_confirmation: "testTEST")
  end

  test "should be valid" do
    assert @person.valid?
  end

  test "first_name should be present" do
    @person.first_name = ""
    assert_not @person.valid?
  end

  test "last_name should be present" do
    @person.last_name = ""
    assert_not @person.valid?
  end

  test "first_name should not be too long" do
    @person.first_name = "a" * 51
    assert_not @person.valid?
  end

  test "last_name should not be too long" do
    @person.last_name = "a" * 51
    assert_not @person.valid?
  end

  test "email should not be too long" do
    @person.email = "a" * 244 + "@example.com"
    assert_not @person.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @person.email = valid_address
      assert @person.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @person.email = invalid_address
      assert_not @person.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email should be unique" do
    duplicate_person = @person.dup
    duplicate_person.email = @person.email.upcase
    @person.save
    assert_not duplicate_person.valid?
  end

  test "email should be saved as lowercase" do
    mixed_case_email = "TeSt@ExAmplE.COM"
    @person.email = mixed_case_email
    @person.save
    assert_equal mixed_case_email.downcase, @person.reload.email
  end

  test "password should be present (nonblank)" do
    @person.password = @person.password_confirmation = " " * 6
    assert_not @person.valid?
  end

  test "password should have a minimum length" do
    @person.password = @person.password_confirmation = "a" * 5
    assert_not @person.valid?
  end

  test "person with valid name and email but short password is not valid" do
    @person.first_name = "a" * 50
    @person.last_name = "a" * 50
    @person.email = "a" * 246 + "@test.com"
    @person.password = "a" * 7
    assert_not @person.valid?
  end
end
