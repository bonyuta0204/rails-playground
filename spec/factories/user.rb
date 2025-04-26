# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "TestUser#{n}" }
    # Add other attributes here if your User model requires them
  end
end
