require 'rails_helper'

RSpec.describe Users::IndexUsecase, type: :usecase do
  describe '.call' do
    let!(:user1) { FactoryBot.create(:user, name: 'Alice') }
    let!(:user2) { FactoryBot.create(:user, name: 'Bob') }

    it 'returns :ok and all users as JSON with id and name' do
      status, users_json = described_class.call
      expect(status).to eq(:ok)
      expect(users_json).to contain_exactly(
        a_hash_including('id' => user1.id, 'name' => 'Alice'),
        a_hash_including('id' => user2.id, 'name' => 'Bob')
      )
    end
  end
end
