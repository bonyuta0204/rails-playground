# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tweets, dependent: :destroy
end
