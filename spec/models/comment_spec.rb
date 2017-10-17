require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "validations" do
    context 'invalid attributes' do
      it 'is invalid without content' do
        expect(Comment.create).to be_invalid
      end
      it 'is invalid without a job ID' do
        comment = Comment.create(content: 'cool')
        expect(comment).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid given content' do
        company = Company.new(name: "Turing")
        job     = Job.new(title: "Developer",
                          level_of_interest: 40,
                          city: "Denver",
                          company: company)

        expect(Comment.create(content: 'cool', job: job)).to be_valid
      end
    end
  end

  describe 'relationships' do
    it 'belongs to a job' do
      comment = Comment.new(content: 'cool stuff')
      expect(comment).to respond_to(:job)
    end
  end
end
