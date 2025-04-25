# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    status, response = Users::IndexUsecase.call
    render json: { status: status, users: response }
  end
end
