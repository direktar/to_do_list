require 'rails_helper'

RSpec.describe Project, type: :model do
  describe '#validations' do
    it 'should test that factory is valid' do
      expect(build :project).to be_valid
    end

    it 'should validate the presencce of the name' do
      project = build :project, name: ''
      expect(project).not_to be_valid
      expect(project.errors.messages[:name]).to include("can't be blank")
    end

    it 'should validate the presencce of the user' do
      project = build :project, user: nil
      expect(project).not_to be_valid
      expect(project.errors.messages[:user]).to include("must exist")
    end
  end
end
