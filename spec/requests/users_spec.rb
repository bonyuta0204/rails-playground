# frozen_string_literal: true

require 'swagger_helper'

describe 'Users API' do
  path '/api/users' do
    get 'Retrieves all users' do
      tags 'Users'
      produces 'application/json'

      response '200', 'users found' do
        schema type: :object,
          properties: {
            status: { type: :string },
            users: {
              type: :array,
              items: {
                '$ref' => '#/components/schemas/User'
              }
            }
          },
          required: [ 'status', 'users' ]

        before do
          User.create!(id: 1, name: 'Alice')
          User.create!(id: 2, name: 'Bob')
        end

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['status']).to eq('ok')
          expect(data['users'].size).to eq(2)
          expect(data['users'].map { |u| u['name'] }).to include('Alice', 'Bob')
        end
      end
    end
  end
end
