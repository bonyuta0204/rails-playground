module Users
  class IndexUsecase
    def self.call
      users = User.select(:id, :name)
      [:ok, { users: users }]
    end
  end
end
