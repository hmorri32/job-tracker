require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe "validations" do
    context 'invalid contact' do
      it 'is invalid without attributes' do
        expect(Contact.new).to be_invalid
      end

      it 'is invalid without a name' do
        expect(Contact.new(email: 'cool')).to be_invalid
      end

      it 'is invalid without an email' do
        expect(Contact.new(name: 'cool')).to be_invalid
      end

      it 'is invalid without a position' do
        company = Company.new(name: "Dropbox")

        expect(Contact.new(name: 'cool', email: 'cool', company: company)).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid given all attributes' do
        company = Company.new(name: "Dropbox")

        expect(Contact.new(name: 'cool', position: 'cool', email: 'cool', company: company)).to be_valid
      end
    end
  end

  describe 'relationships' do
    it 'belongs to a company' do
      company = Company.new(name: "Dropbox")
      contact = Contact.new(name: 'cool', position: 'cool', email: 'cool', company: company)
      expect(contact).to respond_to(:company)
    end
  end
end