# frozen_string_literal: true

module Users
  class IndexUsecase
    def self.call
      users = User.select(:id, :name)
      [:ok, users.as_json]
    end
  end
end
