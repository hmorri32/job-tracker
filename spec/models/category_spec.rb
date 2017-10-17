require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    context 'invalid attributes' do

      it 'is invalid without a title' do
        expect(Category.create).to be_invalid
      end

      it 'has a unique name' do
        cat_1 = Category.create(title: 'cool')
        cat_2 = Category.create(title: 'cool')
        expect(cat_1).to be_valid
        expect(cat_2).to be_invalid
      end
    end

    context "valid attributes" do
      it 'is valid given a title' do
        expect(Category.create(title: 'cool')).to be_valid
      end
    end
  end

  describe 'relationships' do
    it 'has many jobs' do
      cat_1 = Category.create(title: 'cool')
      expect(cat_1).to respond_to(:jobs)
    end
  end
end
