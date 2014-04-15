require 'spec_helper'

describe Sanitizable do
  before :each do
    User.reset_sanitization
  end

  context 'macro' do
    it 'must define an attribute' do
      expect {
        User.sanitizes with: :strip
      }.to raise_error ArgumentError, 'User#sanitizes must define at least one attribute'
    end

    it 'can define multiple attributes' do
      User.sanitizes :first_name, :last_name, :username, :email, with: :strip
      expect(User.sanitizable_attribute_names).to match_array %w(first_name last_name username email)
    end

    context 'sanitizer' do
      it 'must be defined through :with or a block' do
        expect {
          User.sanitizes :first_name
        }.to raise_error ArgumentError, 'User#sanitizes must define a :with option or have block'
      end
      
      it 'prefers block sanitizer over :with sanitizer' do
        User.sanitizes :first_name, with: :upcase do |first_name|
          first_name.downcase
        end
        user = User.create(first_name: 'Tobias')
        expect(user.first_name).to eq 'tobias'
      end

      context 'using :with option' do
        it 'can define a sanitizer' do
          User.sanitizes :first_name, :last_name, with: :strip
          user = User.create(first_name: '  Tobias ', last_name: '    Casper')
          expect(user.first_name).to eq 'Tobias'
          expect(user.last_name).to eq 'Casper'
        end

        it 'can define multiple sanitizers' do
          User.sanitizes :email, with: [:strip, :downcase]
          user = User.create(email: 'Tobias.Casper@GMail.com  ')
          expect(user.email).to eq 'tobias.casper@gmail.com'
        end

        it 'can define a sanitizer from Proc' do
          User.sanitizes :email, with: ->(email) { email.strip.downcase }
          user = User.create(email: '  Tobias.Casper@GMail.com')
          expect(user.email).to eq 'tobias.casper@gmail.com'
        end

        it 'can define sanitizers from mixed Symbols and Procs' do
          sanitizers = []
          sanitizers << lambda { |email| email.strip }
          sanitizers << :downcase
          User.sanitizes :email, with: sanitizers
          user = User.create(email: '  Tobias.Casper@GMail.com')
          expect(user.email).to eq 'tobias.casper@gmail.com'
        end
      end

      context 'using a block' do
        it 'can define a sanitizer' do
          User.sanitizes :email do |email|
            email.strip.downcase
          end
          user = User.create(email: '  Tobias.Casper@GMail.com   ')
          expect(user.email).to eq 'tobias.casper@gmail.com'
        end
      end
    end

    context 'in inherited models' do
      it 'can inherit a copy of the sanitizable attributes from the parent class' do
        User.sanitizes :first_name, :last_name, with: [:strip, :upcase]
        Admin = Class.new(User)
        Admin.sanitizes :email, with: [:strip, :downcase]
        expect(User.sanitizable_attribute_names).to match_array %w(first_name last_name)
        expect(Admin.sanitizable_attribute_names).to match_array %w(first_name last_name email)
      end
    end

    context 'contexts' do
      before :each do
        User.sanitizes :first_name, with: :downcase, on: :create
        User.sanitizes :first_name, with: :upcase, on: :update
      end

      it 'recognizes a new object' do
        new_user = User.new
        new_user.first_name = 'Tobias'
        new_user.save
        expect(new_user.first_name).to eq 'tobias'
      end

      it 'recognizes a persisted object' do
        persisted_user = User.create
        persisted_user.first_name = 'Tobias'
        persisted_user.save
        expect(persisted_user.first_name).to eq 'TOBIAS'
      end
    end
  end

  context 'skip sanitation macro' do
    it 'skips sanitation for attribute without context' do
      User.sanitizes :first_name, with: :upcase
      User.skip_sanitization :first_name

      user = User.create(first_name: 'Tobias')
      expect(user.first_name).to eq 'Tobias'
    end

    it 'skips sanitation for attribute in same context' do
      User.sanitizes :first_name, with: :upcase, on: :create
      User.skip_sanitization :first_name, on: :create

      user = User.create(first_name: 'Tobias')
      expect(user.first_name).to eq 'Tobias'
    end

    it 'does not skip sanitation for attribute in main context' do
      User.sanitizes :first_name, with: :upcase, on: :create
      User.skip_sanitization :first_name

      user = User.create(first_name: 'Tobias')
      expect(user.first_name).to eq 'TOBIAS'
    end

    it 'does not skip sanitation for attribute in another context' do
      User.sanitizes :first_name, with: :upcase, on: :create
      User.skip_sanitization :first_name, on: :update

      user = User.create(first_name: 'Tobias')
      expect(user.first_name).to eq 'TOBIAS'
    end
  end
end