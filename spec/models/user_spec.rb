require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'should return user if authenticated' do
      it 'should return same user' do
        @user = User.create(
          name: 'Vivian',
          email: 'vivian@test.com',
          password: 'password',
          password_confirmation: 'password'
        )
        @user2 = User.authenticate_with_credentials('vivian@test.com', 'password')
        expect(@user2).to eq(@user)
      end
    end

  describe 'should return nil if not authenticated' do
      it 'should return nil' do
        @user = User.create(
          name: 'Vivian',
          email: 'vivian@test.com',
          password: 'password',
          password_confirmation: 'password'
        )
        @user2 = User.authenticate_with_credentials('vivian@test.com', 'fakePassword')
        expect(@user2).to be nil
      end
    end
  
    describe 'should authenticate with spaces in email' do
      it 'should return user' do
        @user = User.create(
          name: 'Vivian',
          email: 'vivian@test.com',
          password: 'password',
          password_confirmation: 'password'
        )
        @user2 = User.authenticate_with_credentials('     vivian@test.com', 'password')
        expect(@user2).to eq(@user)
      end
    end

    describe 'should return user with wrong case in email' do
      it 'should return user' do
        @user = User.create(
          name: 'Vivian',
          email: 'ViViAN@test.com',
          password: 'password',
          password_confirmation: 'password'
        )
        @user.email.downcase!
        @user.save
        @user2 = User.authenticate_with_credentials('ViViAn@teSt.com', 'password')
        expect(@user2).to eq(@user)
      end
    end

end
