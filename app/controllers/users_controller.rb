# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    status, response = Users::IndexUsecase.call
    render json: response, status: status
  end
end
