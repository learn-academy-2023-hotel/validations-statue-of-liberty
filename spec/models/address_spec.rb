require 'rails_helper'

RSpec.describe Address, type: :model do
  it 'is not valid without a street number' do
    address1 = Address.create(
      street_name: 'main st', 
      city: 'random', 
      state: 'moon', 
      zip: 123456)
      expect(address1.errors[:street_number]).to_not be_empty
  end
  it 'is not valid without a street name' do
    address1 = Address.create(
      street_number: 123,
      city: 'random', 
      state: 'moon', 
      zip: 123456)
      expect(address1.errors[:street_name]).to_not be_empty
  end
  it 'is not valid without a city' do
    address1 = Address.create(
      street_number: 123,
      street_name: 'main st', 
      state: 'moon',
      zip: 123456)
      expect(address1.errors[:city]).to_not be_empty
  end
  it 'is not valid without a state' do
    address1 = Address.create(
      street_number: 123,
      street_name: 'main st', 
      city: 'random',
      zip: 123456)
      expect(address1.errors[:state]).to_not be_empty
  end
  it 'is not valid without a zip code' do
    address1 = Address.create(
      street_number: 123,
      street_name: 'main st', 
      city: 'random',
      state: 'moon')
    expect(address1.errors[:zip]).to_not be_empty
  end
  it 'does not allow duplicate address' do
    Address.create(
      street_number: 123,
      street_name: 'main st',
      city: 'random',
      state: 'moon',
      zip: 123456)
    address1 = Address.create(
      street_number: 123,
      street_name: 'main st',
      city: 'random',
      state: 'moon',
      zip: 123456)
      expect(address1.errors[:street_number]).to_not be_empty
  #     expect(address1.errors[:street_name]).to_not be_empty
  #     expect(address1.errors[:zip]).to_not be_empty
  end
end
