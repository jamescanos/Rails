require 'rails_helper'

RSpec.describe Company, type: :model do

    before(:all) do
        @company = Company.create(name: nil)        
    end

    it 'checks that a Company cant be empty' do
        expect(@company.name).to be_nil
    end

    it 'checks that a Company can be created' do
        expect(@company).to be_valid
    end

    it 'checks that a Company can be read' do
        expect(Company.find_by_name("Rolling Stone")).to eq(@company)
    end

    it 'checks that a Company can be updated' do
        @company.update(:name => "Rolling Stone - EvilCorp")
        expect(Company.find_by_name("Rolling Stone - EvilCorp")).to eq(@company)
    end

    it 'checks that a Company can be destroyed' do
        @company.destroy
        expect(Company.find_by(name: "Rolling Stone - EvilCorp")).to be_nil
    end

end