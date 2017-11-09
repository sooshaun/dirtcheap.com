require 'rails_helper'

# data = {
#   first_name: 'Ruegen',
#   last_name: 'Aschenbrenner',
#   bsb: '123456',
#   account_number: '1234',
#   privacy: true,
#   user_id: 1,
#   mobile_number: '0123456789',
#   image_data: 'https://clownface.com/img.jpg'
# }

RSpec.describe Profile, type: :model do
  subject { described_class.new(
    first_name: 'Sean', 
    last_name: 'Soo',
    bsb: '012345'
    )}
  
  it 'should be valid with valid details' do 
    expect(subject).to be_valid
  end

  it 'should not be valid with a nil first_name' do 
    subject.first_name = nil
    expect(subject).to_not be_valid
  end

  it 'should not be valid with a nil last_name' do 
    subject.last_name = nil 
    expect(subject).to_not be_valid
  end


  it 'should not be valid with a nil bsb' do 
    subject.bsb = nil
    expect(subject).to_not be_valid
  end

  it 'should not be valid with a bsb under 6 characters' do 
    subject.bsb = '123'
    expect(subject).to_not be_valid
  end

  it 'should not be valid with a bsb over 6 characters' do 
    subject.bsb = '0001234567'
    expect(subject).to_not be_valid
  end

  # it 'should not be valid with a bsb of characters' do 
  #   subject.bsb = '13eggs'
  #   expect(subject).to_not be_valid
  # end



  
  

  
end
