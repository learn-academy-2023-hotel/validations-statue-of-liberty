require 'rails_helper'

RSpec.describe Account, type: :model do
  it "is not valid without a username" do
    Account1 = Account.create( 
      password: 'First', 
      email: 'uno1@aol.com'
    )
    expect(Account1.errors[:username]).to_not be_empty
  end

  it "is not valid without a password" do
    Account1 = Account.create(
      username: 'Uno',
      email: 'uno1@aol.com'
    )
    expect(Account1.errors[:password]).to_not be_empty
  end

  it "is not valid without an email" do
    Account1 = Account.create(
      username: 'Uno',
      password: 'First'
    )
    expect(Account1.errors[:email]).to_not be_empty
  end

  it "is not valid if username is less than 5 characters long" do
    Account1 = Account.create(
      username: 'Uno',
      password: 'First',
      email: 'uno1@aol.com'
    )
    expect(Account1.errors[:username]).to_not be_empty
  end

  it "does not allow duplicate usernames" do
    Account.create(
      username: 'Quatro',
      password: 'Fourth',
      email: 'quatro4@aol.com'
    )
    Account1 = Account.create(
      username: 'Quatro',
      password: 'Fourth',
      email: 'quatro4@aol.com'
    )
    expect(Account1.errors[:username]).to_not be_empty
  end

  it "is not valid if password is less than 6 characters long" do
    Account1 = Account.create(
      username: 'Quatro',
      password: 'Fourt',
      email: 'quatro4@aol.com'
    )
    expect(Account1.errors[:password]).to_not be_empty
  end

  it "does not allow duplicate passwords" do
    Account.create(
      username: 'Cinco',
      password: 'Fivess',
      email: 'cinco5@aol.com'
    )
    Account1 = Account.create(
      username: 'Cinco',
      password: 'Fivess',
      email: 'cinco5@aol.com'
    )
    expect(Account1.errors[:password]).to_not be_empty
  end
end
